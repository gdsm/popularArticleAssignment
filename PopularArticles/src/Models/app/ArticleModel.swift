//
//  ArticleModel.swift
//  PopularArticles
//
//  Created by Gagandeep on 22/02/24.
//

import Foundation

struct ArticleModel: Hashable {
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
    let byline: String
    let type: String
    let title: String
    let abstract: String
    let des_facet: [String]
    let org_facet: [String]
    let per_facet: [String]
    let eta_id: Int
    
    init(model: NetArticleModel) {
        self.uri = model.uri
        self.url = model.url
        self.id = model.id
        self.asset_id = model.asset_id
        self.source = model.source
        self.published_date = model.published_date
        self.updated = model.updated
        self.section = model.section
        self.subsection = model.subsection
        self.nytdsection = model.nytdsection
        self.adx_keywords = model.adx_keywords
        self.byline = model.byline
        self.type = model.type
        self.title = model.title
        self.abstract = model.abstract
        self.des_facet = model.des_facet
        self.org_facet = model.org_facet
        self.per_facet = model.per_facet
        self.eta_id = model.eta_id
    }
}
