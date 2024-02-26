//
//  ArticleRepoTest.swift
//  PopularArticlesTests
//
//  Created by Gagandeep on 23/02/24.
//

import XCTest
@testable import NetworkServices
@testable import PopularArticles


final class ArticleRepoTest: XCTestCase {

    private var config: URLSessionConfiguration!
    private let mockHandlerTag = "ArticleRepoTest"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 1
        config.timeoutIntervalForResource = 1
        config.protocolClasses = [MockURLProtocol.self]
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        MockURLProtocol.unregister(tag: mockHandlerTag)
    }

    func testGetArticlesSuccess() {
        let expectation = XCTestExpectation(description: "Async Waiting")
        MockURLProtocol.register(tag: mockHandlerTag) { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: HTTPStatusCode.ok.rawValue,
                httpVersion: "HTTP/1.1",
                headerFields: [:]
            )!
            let data = MockArticleRepo.stubArticleData.data(using: .utf8)
            return Result.success((response, data))
        }
        
        let repo = ArticleRepo(urlBuilder: URLEnvironment.qa, networkInterface: NetworkService(config: config))
        Task {
            do {
                let requestModel = NetArticleRequestModel(section: .Viewed, period: .One, shareType: nil)
                let result = try await repo.getArticles(model: requestModel)
                switch result {
                case .failure(_):
                    XCTFail("Expecting success")
                case .success(_):
                    // Do stuff to match values.
                    expectation.fulfill()
                }
            } catch (let exception) {
                XCTFail("Exception in fetching current weather. \(exception)")
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }

    func testGetArticlesFailure() {
        let expectation = XCTestExpectation(description: "Async Waiting")
        MockURLProtocol.register(tag: mockHandlerTag) { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: HTTPStatusCode.badRequest.rawValue,
                httpVersion: "HTTP/1.1",
                headerFields: [:]
            )!
            return Result.success((response, nil))
        }
        
        let repo = ArticleRepo(urlBuilder: URLEnvironment.qa, networkInterface: NetworkService(config: config))
        Task {
            do {
                let requestModel = NetArticleRequestModel(section: .Viewed, period: .One, shareType: nil)
                let result = try await repo.getArticles(model: requestModel)
                switch result {
                case .failure(_):
                    expectation.fulfill()
                case .success(_):
                    XCTFail("Expecting failure")
                }
            } catch (let exception) {
                XCTFail("Exception in fetching current weather. \(exception)")
            }
        }
        
        wait(for: [expectation], timeout: 1)
    }
}
