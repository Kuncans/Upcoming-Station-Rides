//
//  FilterTabView.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 23/02/2022.
//

import SwiftUI

struct FilterTabView: View {
    
    @Binding var selectedTab: Tabs
    @Binding var showingFilterModal: Bool
    @Binding var upcomingCount: Int
    @Binding var pastCount: Int
    
    var body: some View {
        
        HStack {
            HStack(spacing: 25) {
                FilterTabItem(selectedTab: $selectedTab, numberValue: nil, tabType: .nearest)
                FilterTabItem(selectedTab: $selectedTab, numberValue: $upcomingCount, tabType: .upcoming)
                FilterTabItem(selectedTab: $selectedTab, numberValue: $pastCount, tabType: .past)
            }
            Spacer()
            Button {
                showingFilterModal.toggle()
            } label: {
                HStack (spacing: 5) {
                    Image("Sort")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color.theme.accent)
                        .frame(width: 14, height: 14)
                    Text("Filters")
                        .font(.interMedium)
                        .foregroundColor(.black)
                }
            }
        }
        .padding(.horizontal, 21)
    }
}

struct FilterTabView_Previews: PreviewProvider {
    static var previews: some View {
        FilterTabView(selectedTab: .constant(.nearest), showingFilterModal: .constant(false), upcomingCount: .constant(0), pastCount: .constant(0))
    }
}

