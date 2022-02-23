//
//  User.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import Foundation

struct User: Codable {
    
    let station_code: Int
    let name: String
    let url: String
    
}

struct MockUser {
    
    static let devUser = User(station_code: 14, name: "Duncs Kents", url: "")
    
}
