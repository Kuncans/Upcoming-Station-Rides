//
//  Ride.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import Foundation

struct Ride: Codable, Identifiable {
    
    let id: Int
    let origin_station_code: Int
    let station_path: [Int]
    let date: String
    let map_url: String
    let state: String
    let city: String
    var station_path_string: [String] {
        station_path.map { int in
            String(int)
        }
    }
//    var formattedDate: Date {
//        getFormattedDate(date: date)
//    }
//    
//    func getFormattedDate(date: String) -> Date {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM/DD/YYYY HH:MM"
//    }
    
}

struct MockRide {
    
    static let devRide = Ride(id: 210,
                              origin_station_code: 5,
                              station_path: [55, 64, 71, 83],
                              date: "12/19/2021 04:58 AM",
                              map_url: "https://picsum.photos/200",
                              state: "Goa",
                              city: "Marmagao")
    
}
