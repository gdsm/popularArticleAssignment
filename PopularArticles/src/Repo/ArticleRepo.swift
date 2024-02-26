//
//  ArticleRepo.swift
//  PopularArticles
//
//  Created by Gagandeep on 22/02/24.
//

import Foundation
import NetworkServices

class ArticleRepo {
//    shared/{period}.json
    let urlBuilder: URLBuilder
    let networkInterface: NetworkProtocol
    
    /// MARK: Init methods
    init(urlBuilder: URLBuilder, networkInterface: NetworkProtocol) {
        self.urlBuilder = urlBuilder
        self.networkInterface = networkInterface
    }

    /// Fetch articles given with request model
    /// - Parameter model: Request params
    /// - Returns: List of articles.
    func getArticles(model: NetArticleRequestModel) async throws -> Result<[ArticleModel], ServiceError> {
        guard let request = self.buildRequest(model: model, apiKey: self.urlBuilder.getApiKey()) else {
            return Result.failure(ServiceError.unknown)
        }
        let result: Result<NetArticlesResultModel, ServiceError> = try await networkInterface.request(urlRequest: request)
        switch result {
        case .success(let model):
            let result = model.results.map { ArticleModel(model: $0) }
            return .success(result)
        case .failure(let error):
            return .failure(error)
        }

    }
    
    /// Builder method to URL
    /// - Parameter coord: Lat , Lon coordinates.
    /// - Returns: Method return optional url.
    internal func buildRequest(model: NetArticleRequestModel, apiKey: String) -> URLRequest? {
        guard let url = URL(string: "\(urlBuilder.getBaseUrl())\(model.section.rawValue)/\(model.period.rawValue).json?api-key=\(apiKey)") else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.GET.rawValue
        return request
    }
}
