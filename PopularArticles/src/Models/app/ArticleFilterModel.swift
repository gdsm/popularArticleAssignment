//
//  ArticleFilterModel.swift
//  PopularArticles
//
//  Created by Gagandeep on 23/02/24.
//

import Foundation

struct ArticleFilterModel: Equatable {
    var selectedPeriod: Int
    var selectedSection: Int
    var shareType: String? = nil
}
