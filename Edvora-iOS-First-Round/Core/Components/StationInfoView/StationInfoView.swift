//
//  StationInfoView.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 23/02/2022.
//

import SwiftUI

struct StationInfoView: View {
    
    let ride: Ride
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.theme.cardBackground)
            
            VStack {
                Image("MockImage")
                    .resizable()
                    .frame(width: 349, height: 173)
                    .overlay(
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                            .frame(width: 80.13, height: 26)
                            .foregroundColor(.theme.accent)
                            
                            Text("100 Km")
                                .foregroundColor(.white)
                                .font(.interBold)
                        }
                            .offset(x: 120, y: 60)
                    )
                
                Spacer()
                
                HStack {
                    HStack {
                        Image("HashNumber")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.theme.accent)
                            .frame(width: 18, height: 18)
                        Text("\(ride.id)")
                            .font(.interRegular)
                        Spacer()
                        Image("Calendar")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.theme.accent)
                            .frame(width: 14, height: 14)
                        Text("16th Feb")
                            .font(.interRegular)
                    }
                    .padding(.horizontal)
                }
                
                Spacer()
            }
            
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(width: 349, height: 228)

    }
}

struct StationInfoView_Previews: PreviewProvider {
    static var previews: some View {
        StationInfoView(ride: MockRide.devRide)
    }
}
