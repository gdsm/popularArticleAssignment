//
//  ArticleRequestModel.swift
//  PopularArticles
//
//  Created by Gagandeep on 22/02/24.
//

import Foundation

enum SectionType: String, CaseIterable {
    case Viewed = "viewed"
    case Shared = "shared"
    case Emailed = "emailed"
}

enum PeriodType: String, CaseIterable {
    case One = "1"
    case Seven = "7"
    case Thirty = "30"
}

struct NetArticleRequestModel {
    let section: SectionType
    let period: PeriodType
    let shareType: String?
}
