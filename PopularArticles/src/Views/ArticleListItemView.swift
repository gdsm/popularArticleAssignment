//
//  NewsListItemView.swift
//  PopularArticles
//
//  Created by Gagandeep on 22/02/24.
//

import SwiftUI

struct ArticleListItemView: View {
    
    @EnvironmentObject var theme: AppTheme
    let article: ArticleModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(article.title)")
                .foregroundColor(theme.textColor)
                .fontWeight(.bold)
            
            Text("\(article.abstract)")
                .foregroundColor(theme.textColor)
                .fontWeight(.regular)
            
            Text("\(LocalisedString.source): \(article.source)")
                .foregroundColor(theme.textColor)
                .fontWeight(.thin)
        }
    }
}

#Preview {
    ArticleListItemView(
        article: ArticleModel(
            model: NetArticleModel(
                uri: "",
                url: "",
                id: 0,
                asset_id: 0,
                source: "",
                published_date: "",
                updated: "",
                section: "",
                subsection: "",
                nytdsection: "",
                adx_keywords: "",
                byline: "",
                type: "",
                title: "Article Title",
                abstract: "Article Abstract Title",
                des_facet: [],
                org_facet: [],
                per_facet: [],
                eta_id: 0
            )
        )
    )
    .environmentObject(AppTheme())
}
