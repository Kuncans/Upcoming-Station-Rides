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
    
    @Published var selectedRide: Ride? = nil
    @Published var displayedRides: [Ride] = []
    @Published var allRides: [Ride] = []
    
    @Published var selectedTab: Tabs = .nearest {
        didSet {
            updateDisplayedRides()
        }
    }
    
    @Published var showingFilterModal: Bool = false
    @Published var upcomingCount: Int = 0
    @Published var pastCount: Int = 0
        
    private let userDataService = UserDataService()
    private let rideDataService = RideDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        rideDataService.$allRides
            .sink { [weak self] returnedRides in
                let uniqueRides = returnedRides.uniqued()
                self?.allRides = uniqueRides
                self?.upcomingCount = uniqueRides.filter { $0.unformattedDate > Date() }.count
                self?.pastCount = uniqueRides.filter { $0.unformattedDate < Date() }.count
            }
            .store(in: &cancellables)
        
        userDataService.$user
            .sink { [weak self] returnedUser in
                self?.user = returnedUser
            }
            .store(in: &cancellables)
    }
    
    func updateDisplayedRides() {
        switch self.selectedTab {
            
        case .nearest:
            self.displayedRides = allRides
        case .upcoming:
            self.displayedRides = allRides.filter { $0.unformattedDate > Date() }
        case .past:
            self.displayedRides = allRides.filter { $0.unformattedDate < Date() }
        }
    }
    
    func dismissSelectedRide() {
        self.selectedRide = nil
    }

}

