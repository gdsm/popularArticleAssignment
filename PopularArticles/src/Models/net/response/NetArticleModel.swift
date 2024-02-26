//
//  ArticleModel.swift
//  PopularArticles
//
//  Created by Gagandeep on 22/02/24.
//

import Foundation

struct NetArticleModel: Codable {
    let uri: String
    let url: String
    let id: Int
    let asset_id: Int
    let source: String
    let published_date: String
    let updated: String
    let section: String
    let subsection: String
    let nytdsection: String
    let adx_keywords: String
    // TODO: Check parsing of NSNULL in json
//    let column: NSNull
    let byline: String
    let type: String
    let title: String
    let abstract: String
    let des_facet: [String]
    let org_facet: [String]
    let per_facet: [String]
    let eta_id: Int
}
