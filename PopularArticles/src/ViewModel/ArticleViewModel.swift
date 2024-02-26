//
//  ArticleViewModel.swift
//  PopularArticles
//
//  Created by Gagandeep on 22/02/24.
//

import Foundation
import Logging

enum DownloadState: Equatable {
    case notStarted
    case inProgress
    case finished
    case permissionError
    case error(message: String)
}

class ArticleViewModel: ObservableObject {
    @Published var articles: [ArticleModel] = []
    @Published var downloadState: DownloadState = .notStarted
    private var task: Task<Void, Never>?

    private let repo: ArticleRepo

    init(repo: ArticleRepo) {
        self.repo = repo
    }

    func getPopularArticles(
        selection: ArticleFilterModel = ArticleFilterModel(selectedPeriod: 0, selectedSection: 0)
    ) {
        if (downloadState == .inProgress) {
            Log.warn("Cancelling previous request.")
            task?.cancel()
        }
        downloadState = .notStarted
        let section = SectionType.allCases[selection.selectedSection]
        let period = PeriodType.allCases[selection.selectedPeriod]
        let request = NetArticleRequestModel(
            section: section,
            period: period,
            shareType: selection.shareType
        )
        downloadState = .inProgress
        task = Task {
            do {
                let result = try await repo.getArticles(model: request)
                switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.downloadState = .error(message: "Failed to fetch articles : \(error)")
                    }
                case .success(let articles):
                    DispatchQueue.main.async {
                        self.articles = articles
                        self.downloadState = .finished
                    }
                }
            } catch (let exception) {
                DispatchQueue.main.async {
                    self.downloadState = .error(message: "Failed to fetch articles : \(exception)")
                    Log.error("Failed to fetch articles : \(exception.localizedDescription)")
                }
            }
        }
    }
}
