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
    @Published var allRides: [Ride] = []
    @Published var selectedTab: Tabs = .nearest
    @Published var showingFilterModal: Bool = false
    @Published var selectedRide: Ride? = nil 
    
    private let userDataService = UserDataService()
    private let rideDataService = RideDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        userDataService.$user
            .sink { [weak self] returnedUser in
                self?.user = returnedUser
            }
            .store(in: &cancellables)
        
        rideDataService.$allRides
            .sink { [weak self] returnedRides in
                self?.allRides = returnedRides
            }
            .store(in: &cancellables)
    }
    
    func dismissSelectedRide() {
        self.selectedRide = nil
    }
}

//
//                switch vm.selectedTab {
//                case .nearest:
//                    Text("NEAREST")
//                case .upcoming:
//                    Text("UPCOMING")
//                case .past:
//                    Text("PAST")
//                }
