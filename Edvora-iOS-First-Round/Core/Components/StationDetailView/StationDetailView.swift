//
//  StationDetailView.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 23/02/2022.
//

import SwiftUI

struct StationDetailView: View {
    
    @Binding var ride: Ride
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 53)
                .frame(maxHeight: .infinity, alignment: .top)
                .foregroundColor(.white.opacity(0.7))
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(.black)
                    .frame(width: 129, height: 4)
                    .padding(.bottom, 20)
                    .padding(.top, 16)
                
                StationImageView(ride: ride)
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
                        
                        StationDetailRow(lhsLabel: "Date", lhsValue: ride.formattedDate,
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
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct StationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StationDetailView(ride: .constant(MockRide.devRide))
    }
}
