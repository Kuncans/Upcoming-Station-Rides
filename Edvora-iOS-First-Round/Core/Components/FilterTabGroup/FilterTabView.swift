//
//  FilterTabView.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 23/02/2022.
//

import SwiftUI

struct FilterTabView: View {
    
    @Binding var selectedTab : Tabs
    @State var showFilterPopup = false
    
    var body: some View {
        
        HStack {
            HStack(spacing: 23) {
                FilterTabItem(selectedTab: $selectedTab, tabType: .nearest)
                FilterTabItem(selectedTab: $selectedTab, numberValue: 4, tabType: .upcoming)
                FilterTabItem(selectedTab: $selectedTab, numberValue: 2, tabType: .past)
            }
            Spacer()
            Button {
                showFilterPopup = true
            } label: {
                HStack (spacing: 5) {
                    Image("Sort")
                        .resizable()
                        .frame(width: 14, height: 14)
                    Text("Filters")
                        .font(.interRegular)
                        .foregroundColor(.black)
                }
            }
        }
        .padding(.horizontal, 21)
    }
}

struct FilterTabView_Previews: PreviewProvider {
    static var previews: some View {
        FilterTabView(selectedTab: .constant(.nearest))
    }
}
