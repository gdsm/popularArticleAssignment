//
//  NewsDetailView.swift
//  PopularArticles
//
//  Created by Gagandeep on 23/02/24.
//

import SwiftUI


struct ArticleDetailView: View {
    let theme = AppTheme()

    let article: ArticleModel
    var body: some View {
        VStack {
            if let url = URL(string: article.url) {
                WebView(url: url)
                            .edgesIgnoringSafeArea(.all)
            } else {
                Text("Invalid URL")
            }
        }
        .toolbarBackground(theme.secondaryColor, for: .navigationBar)
        .navigationTitle(article.title)
    }
}

//#Preview {
//    NewsDetailView()
//}
