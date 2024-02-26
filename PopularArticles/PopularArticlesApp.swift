//
//  PopularArticlesApp.swift
//  PopularArticles
//
//  Created by Gagandeep on 22/02/24.
//

import SwiftUI
import NetworkServices

@main
struct PopularArticlesApp: App {
    var body: some Scene {
        WindowGroup {
            ArticlesListView(
                viewModel: ArticleViewModel(
                    repo: ArticleRepo(
                        urlBuilder: URLEnvironment.prod,
                        networkInterface: NetworkFactory.getService()
                    )
                )
            )
        }
    }
}
