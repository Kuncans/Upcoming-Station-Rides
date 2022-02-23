//
//  StationDetailView.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 23/02/2022.
//

import SwiftUI

struct StationDetailView: View {
    
    let ride: Ride
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(.black)
                .frame(width: 127, height: 6)
                .padding(.top, 12)
                .padding(.bottom, 20)
            
            Image("MockImage")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 17))
                .frame(width: 332, height: 224)
                .padding(.bottom, 22)
            
            ZStack {
                RoundedRectangle(cornerRadius: 17)
                    .foregroundColor(.white)
                
                VStack (spacing: 16) {
                    
                    StationDetailRow(lhsLabel: "Ride ID", lhsValue: "\(ride.id)",
                                     rhsLabel: "Origin Station", rhsValue: "\(ride.origin_station_code)")
                    
                    Divider()
                    
                    StationDetailRow(lhsLabel: "Date", lhsValue: "16th Feb",
                                     rhsLabel: "Distance", rhsValue: "100 Km")
                    
                    Divider()
                    
                    StationDetailRow(lhsLabel: "State", lhsValue: "\(ride.state)",
                                     rhsLabel: "City", rhsValue: "\(ride.city)")
                                        
                    Divider()
                                        
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Station Path")
                                .font(.interMedium10)
                                .foregroundColor(.gray)
                            Text("\(ride.station_path_string.joined(separator: ", "))")
                                .font(.interMedium16)
                                .lineLimit(1)
                        }
                        
                        Spacer()
                        
                    }
                    
                }
                .padding(.horizontal)
            }
            .shadow(color: .black.opacity(0.15), radius: 15, x: 0, y: 5)
            .frame(width: 333, height: 279)
        }
        .frame(maxWidth: .infinity)
        .frame(minHeight: 640, alignment: .top)
        .background(.thinMaterial)
    }
}

struct StationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StationDetailView(ride: MockRide.devRide)
    }
}
