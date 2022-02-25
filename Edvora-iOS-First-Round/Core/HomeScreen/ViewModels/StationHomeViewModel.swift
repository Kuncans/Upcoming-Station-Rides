//
//  StationHomeViewModel.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import Foundation
import Combine

final class StationHomeViewModel: ObservableObject {
    
    @Published var user: User?
    
    @Published var selectedRide: DisplayRide = MockDisplayRide.devRide
    
    @Published var displayedRides: [DisplayRide] = []
    @Published var allDisplayRides: [DisplayRide] = []

    @Published var allCityOptions: [String] = []
    @Published var displayCityOptions: [String] = []
    
    @Published var stateOptions: [String] = []
    @Published var citiesForState: [String: [String]] = [:]
    
    @Published var selectedTab: Tabs = .nearest {
        didSet {
            updateDisplayedRides()
        }
    }
    
    @Published var showingFilterModal: Bool = false
    @Published var cityFilter: String? = nil {
        didSet {
            updateDisplayedRides()
        }
    }
    
    @Published var stateFilter: String? = nil {
        didSet {
            updateDisplayedRides()
            updateDisplayedCityOptions()
        }
    }
    
    @Published var upcomingCount: Int = 0
    @Published var pastCount: Int = 0
    
    private let userDataService = UserDataService()
    private let rideDataService = RideDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        Publishers.CombineLatest(rideDataService.$rawRides, userDataService.$user)
            .sink { [weak self] returnedRides, returnedUser in
                let uniqueRides: [DisplayRide] = returnedRides.uniqued()
                    .map { rawRide in
                        var distanceFromUser = Int.max
                        
                        for pathStationCode in rawRide.station_path {
                            distanceFromUser = min(distanceFromUser, abs(pathStationCode - (returnedUser?.station_code ?? 0)))
                        }
                        
                        return DisplayRide(id: rawRide.id,
                                    origin_station_code: rawRide.origin_station_code,
                                    station_path: rawRide.station_path,
                                    date: rawRide.date,
                                    map_url: rawRide.map_url,
                                    state: rawRide.state,
                                    city: rawRide.city,
                                    distanceFromUser: distanceFromUser)
                    }
                self?.allDisplayRides = uniqueRides
                self?.upcomingCount = uniqueRides.filter { $0.unformattedDate > Date() }.count
                self?.pastCount = uniqueRides.filter { $0.unformattedDate < Date() }.count
                self?.allCityOptions = uniqueRides.map { $0.city }.uniqued()
                self?.stateOptions = uniqueRides.map { $0.state }.uniqued()
                self?.citiesForState = Dictionary(grouping: uniqueRides, by: {$0.state})
                    .mapValues({ rides in
                        rides.map { $0.city }
                    })
                
                self?.user = returnedUser
            }
            .store(in: &cancellables)
    }
    
    func updateDisplayedRides() {
        
        self.displayedRides = allDisplayRides
        
        switch self.selectedTab {
            
        case .nearest:
            self.displayedRides = allDisplayRides.sorted(by: { $0.distanceFromUser < $1.distanceFromUser})
        case .upcoming:
            self.displayedRides = allDisplayRides.filter { $0.unformattedDate > Date() }.sorted(by: { lhs, rhs in
                lhs.unformattedDate < rhs.unformattedDate
            })
        case .past:
            self.displayedRides = allDisplayRides.filter { $0.unformattedDate < Date() }.sorted(by: { lhs, rhs in
                lhs.unformattedDate > rhs.unformattedDate
            })
        }
        
        self.displayedRides = applyGeographicFilters(arrToFilter: displayedRides)
    }
    
    func updateDisplayedCityOptions() {
        
        if let filter = stateFilter {
            displayCityOptions = allCityOptions.filter({ city in
                citiesForState[filter]?.contains(city) ?? false
            })
        }
        
        else {
            displayCityOptions = allCityOptions
        }
        
    }
    
    func applyGeographicFilters(arrToFilter: [DisplayRide]) -> [DisplayRide] {
        var result: [DisplayRide] = arrToFilter
        
        if let filter = cityFilter {
            result = filterByCity(arrToFilter: arrToFilter, city: filter)
        }
        if let filter = stateFilter {
            result = filterByState(arrToFilter: result, state: filter)
        }
        return result
    }
    
    func updateSelectedRide(ride: DisplayRide) {
        self.selectedRide = ride
    }
    
    func filterByCity(arrToFilter: [DisplayRide], city: String) -> [DisplayRide] {
        let filteredRides = arrToFilter.filter({$0.city == city})
        return filteredRides
    }
    
    func filterByState(arrToFilter: [DisplayRide], state: String) -> [DisplayRide] {
        let filteredRides = arrToFilter.filter({$0.state == state})
        return filteredRides
    }
    
}

