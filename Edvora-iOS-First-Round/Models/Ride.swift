//
//  Ride.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import Foundation

struct Ride: Codable, Identifiable, Hashable {

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
    var unformattedDate: Date {
        let date = Ride.dateFormatter.date(from: date)!
        return date
    }
    
    var formattedDate: String {
        let date = Ride.dateFormatter.date(from: date)!
        let dayString = Ride.dayFormatter.string(from: date)
        let monthString = Ride.monthFormatter.string(from: date)
        let day = dayString.suffix(1)
        let suffixString: String
        switch day {
        case "1":
            suffixString = "st"
        case "2":
            suffixString = "nd"
        case "3":
            suffixString = "rd"
        default:
            suffixString = "th"
        }
        return dayString + suffixString + " " + monthString
    }
    
    var distanceToUser: Int?
    
    func calculateDistanceTo(stationCode: Int) -> Int {
        var result = Int.max
        
        for pathStationCode in station_path {
            result = min(result, abs(pathStationCode - stationCode))
        }
        
        return result
    }
    
    private static let dayFormatter: DateFormatter = {
        let result = DateFormatter()
        result.dateFormat = "d"
        return result
    }()
    
    private static let monthFormatter: DateFormatter = {
        let result = DateFormatter()
        result.dateFormat = "MMM"
        return result
    }()
    
    private static let dateFormatter: DateFormatter = {
        let result = DateFormatter()
        result.dateFormat = "MM/dd/yyyy hh:mm a"
        return result
    }()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Ride, rhs: Ride) -> Bool {
        return lhs.id == rhs.id
    }

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
