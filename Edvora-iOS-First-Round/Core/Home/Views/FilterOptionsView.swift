//
//  FilterOptionsView.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 24/02/2022.
//

import SwiftUI

struct FilterOptionsView: View {

//    @Binding var filterCityOptions: [String]
//    @Binding var filterStateOptions: [String]
//    @Binding var selectedCityFilter: String?
//    @Binding var selectedStateFilter: String?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.3), radius: 2, x: 1, y: -1)
            
            VStack {
                Text("Filters")
                    .font(.callout)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top, .leading])
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.theme.filterBackground)
                    
                    HStack {
                        Text("State")
                            .font(.caption)
                            .foregroundColor(.theme.secondaryFontColor)
                        Spacer()
                        Image("CustomChevronDown")
                            .resizable()
                            .frame(width: 10, height: 8)
                            .tint(.black)
                    }
                    .padding(.horizontal)
                }
                .frame(width: 198, height: 38, alignment: .center)
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.theme.filterBackground)
                    
                    HStack {
                        Text("City")
                            .font(.caption)
                            .foregroundColor(.theme.secondaryFontColor)
                        Spacer()
                        Image("CustomChevronDown")
                            .resizable()
                            .frame(width: 10, height: 8)
                            .tint(.black)
                    }
                    .padding(.horizontal)

                }
                .frame(width: 198, height: 38, alignment: .center)

                Spacer()
            }
            
        }
        .frame(width: 228, height: 148)
    }
}

struct FilterOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        FilterOptionsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
