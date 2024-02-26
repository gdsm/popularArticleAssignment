//
//  ArticleFilterView.swift
//  PopularArticles
//
//  Created by Gagandeep on 23/02/24.
//

import SwiftUI

struct ArticleFilterView: View {
    
    @EnvironmentObject var theme: AppTheme
    @Binding var selection: ArticleFilterModel
    var applyFilter: ((ArticleFilterModel) -> Void)?

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Spacer()
                
                FilterView(title: LocalisedString.days, selectedOption: $selection.selectedPeriod, options: PeriodType.allCases.map { $0.rawValue })
                .environmentObject(theme)
                
                Spacer()

                FilterView(title: LocalisedString.category, selectedOption: $selection.selectedSection, options: SectionType.allCases.map { $0.rawValue })
                .environmentObject(theme)

                Spacer()
            }
            Button(LocalisedString.apply) {
                applyFilter?(selection)
            }
        }
    }
}

#Preview {
    ArticleFilterView(
        selection: .constant(ArticleFilterModel(selectedPeriod: 0, selectedSection: 0)),
        applyFilter: nil
    )
    .environmentObject(AppTheme())
}
