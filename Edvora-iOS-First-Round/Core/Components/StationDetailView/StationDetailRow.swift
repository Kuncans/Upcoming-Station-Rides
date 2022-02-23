//
//  StationDetailRow.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 23/02/2022.
//

import SwiftUI

struct StationDetailRow: View {
    
    let lhsLabel: String
    let lhsValue: String
    let rhsLabel: String
    let rhsValue: String
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(lhsLabel)
                    .font(.interMedium10)
                    .foregroundColor(.gray)
                Text(lhsValue)
                    .font(.interMedium16)
            }
            .frame(width: 200, alignment: .leading)
            
        
            
            VStack (alignment: .leading) {
                Text(rhsLabel)
                    .font(.interMedium10)
                    .foregroundColor(.gray)
                Text(rhsValue)
                    .font(.interMedium16)
                    .lineLimit(1)
            }
            
            Spacer()
        }
    }
}

//struct StationDetailRow_Previews: PreviewProvider {
//    static var previews: some View {
//        StationDetailRow()
//    }
//}
