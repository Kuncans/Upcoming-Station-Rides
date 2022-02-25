//
//  FilterDropdownItem.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 24/02/2022.
//

import SwiftUI

struct FilterDropdownItem: View {
    
    let title: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.theme.filterBackground)
            
            HStack {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.theme.secondaryFontColor)
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(width: 198, height: 38, alignment: .center)
    }
}



struct FilterDropdownItem_Previews: PreviewProvider {
    static var previews: some View {
        FilterDropdownItem(title: "Crimea")
            .preferredColorScheme(.dark)
    }
}
