//
//  NewsListView.swift
//  PopularArticles
//
//  Created by Gagandeep on 22/02/24.
//

import SwiftUI
import NetworkServices

struct ArticlesListView: View {
    let theme = AppTheme()

    @StateObject var viewModel: ArticleViewModel
    @State private var showFilters = false
    @State var selection: ArticleFilterModel = ArticleFilterModel(selectedPeriod: 0, selectedSection: 0)
    @State private var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                switch viewModel.downloadState {
                case .error(let message):
                    Text("Error in fetching article \(message)")
                case .inProgress, .notStarted:
                    ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .foregroundColor(theme.textColor)
                case .finished:
                    if (showFilters) {
                        getFilterView()
                    }
                    getList()
                default:
                    Text("Unknown error occured")
                }
            }
            .toolbar {
                Button(action: {
                    showFilters = !showFilters
                }) {
                    Image(systemName: "line.3.horizontal.decrease.circle.fill")
                        .foregroundColor(theme.textColor)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(LocalisedString.appTitle)
            .background(theme.primaryColor)
            .onAppear() {
                viewModel.getPopularArticles(selection: selection)
            }
            .toolbarBackground(theme.terinaryColor, for: .navigationBar)
            .navigationDestination(for: ArticleModel.self) { article in
                ArticleDetailView(article: article)
            }
        }
        .tint(theme.textColor)
    }
    
    private func getFilterView() -> some View {
        ArticleFilterView(selection: $selection, applyFilter: { filterValue in
            selection = filterValue
            showFilters = false
            viewModel.getPopularArticles(selection: filterValue)
        })
        .environmentObject(theme)
    }
    
    private func getList() -> some View {
        List(viewModel.articles, id: \.self) { item in
            NavigationLink(value: item) {
                ArticleListItemView(article: item)
                .environmentObject(theme)
            }
            .listRowBackground(Color.clear) // Uses Color
            .foregroundColor(theme.textColor)
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    ArticlesListView(
        viewModel: ArticleViewModel(
            repo: ArticleRepo(
                urlBuilder: URLEnvironment.qa,
                networkInterface: NetworkFactory.getService()
            )
        )
    )
}
