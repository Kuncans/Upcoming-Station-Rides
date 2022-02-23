//
//  UserDataService.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import Foundation
import Combine

final class RideDataService {

    @Published var allRides: [Ride] = []

    private var rideSubscription: AnyCancellable?

    init() {
        getRides()
    }

    func getRides() {

        guard let url = URL(string: "https://assessment.api.vweb.app/rides")
            else { return }
        
        rideSubscription = NetworkManager.download(url: url)
            .decode(type: [Ride].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedRides) in
                self?.allRides = returnedRides
                self?.rideSubscription?.cancel()
            })
    }
}
