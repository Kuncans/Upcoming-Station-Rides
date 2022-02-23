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
    
}
