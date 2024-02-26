//
//  FilterView.swift
//  PopularArticles
//
//  Created by Gagandeep on 22/02/24.
//

import SwiftUI

struct FilterView: View {
    
    @EnvironmentObject var theme: AppTheme
    
    let title: String
    @Binding var selectedOption: Int
    let options: [String]
    
    var body: some View {
        VStack(alignment: .center) {
            Text("\(title)")
                .multilineTextAlignment(.leading)
                .foregroundColor(theme.textColor)

            VStack(alignment: .leading) {
                Picker(title, selection: $selectedOption) {
                    ForEach(0 ..< options.count) { index in
                        Text("\(options[index])").tag(index)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(theme.textColor)
                    }
                }
                .pickerStyle(DefaultPickerStyle())
            }
        }
        .background(Color.clear)
    }
}

#Preview {
    FilterView(
        title: LocalisedString.days,
        selectedOption: .constant(0),
        options: PeriodType.allCases.map {$0.rawValue}
    )
    .environmentObject(AppTheme())
}
