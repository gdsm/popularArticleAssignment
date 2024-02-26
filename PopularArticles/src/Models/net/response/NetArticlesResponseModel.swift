//
//  PopularArticlesViewModel.swift
//  PopularArticles
//
//  Created by Gagandeep on 22/02/24.
//

import Foundation

struct NetArticlesResultModel: Codable {
    let status: String
    let copyright: String
    let num_results: Int
    let results: [NetArticleModel]
}
