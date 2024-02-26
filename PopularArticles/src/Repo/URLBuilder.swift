//
//  URLBuilder.swift
//  PopularArticles
//
//  Created by Gagandeep on 19/02/24.
//

import Foundation

protocol URLBuilder {
    func getBaseUrl() -> String
    func getAppId() -> String
    func getApiKey() -> String
}

enum URLEnvironment {
    case prod
    case qa
    case dev
}

extension URLEnvironment: URLBuilder {
    func getBaseUrl() -> String {
        switch self {
        case .prod, .qa, .dev:
            return "https://api.nytimes.com/svc/mostpopular/v2/"
        }
    }
    
    func getAppId() -> String {
        switch self {
        case .prod, .qa, .dev:
            return "0e35d6c8-a5f8-4ed8-a38a-404798bcb98f"
        }
    }
    
    func getApiKey() -> String {
        switch self {
        case .prod:
            // TODO: Perform encrytption.
            return "ZnSrD1G64uAcCRwzevypGhfz6urn5JUD"
        case .qa, .dev:
            return "ZnSrD1G64uAcCRwzevypGhfz6urn5JUD"
        }
    }
}
