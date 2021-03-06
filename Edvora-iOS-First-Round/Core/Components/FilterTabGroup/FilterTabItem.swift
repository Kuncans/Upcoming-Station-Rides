//
//  FilterTabItem.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 23/02/2022.
//

import SwiftUI

struct FilterTabItem: View {
    
    @Binding var selectedTab: Tabs
    var numberValue: Binding<Int>?
    let tabType: Tabs
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                self.selectedTab = tabType
            } label: {
                if let number = numberValue?.wrappedValue {
                    Text(tabType.rawValue + " (\(number))")
                        .font(selectedTab == tabType ? .interBold : .interRegular)
                        .foregroundColor(selectedTab == tabType ? .black : .theme.secondaryFontColor)
                        .font(Font.custom("Inter-Bold", size: 14))
                        .lineLimit(1)

                }
                else {
                    Text(tabType.rawValue)
                        .font(selectedTab == tabType ? .interBold : .interRegular)
                        .foregroundColor(selectedTab == tabType ? .black : .theme.secondaryFontColor)
                        .font(Font.custom("Inter-Bold", size: 14))
                        .lineLimit(1)
                }                  
            }
            if selectedTab == tabType {
                Rectangle()
                    .frame(width: 39, height: 2)
                    .foregroundColor(Color.theme.accent)
            }
        }
    }
}

struct FilterTabItem_Previews: PreviewProvider {
    static var previews: some View {
        FilterTabItem(selectedTab: .constant(.nearest), numberValue: .constant(0), tabType: .nearest)
    }
}
