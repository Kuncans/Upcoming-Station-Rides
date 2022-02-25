//
//  UserImageService.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import Foundation
import SwiftUI
import Combine

final class StationImageService {

    @Published var stationImage: UIImage? = nil

    private var stationImageSubscription: AnyCancellable?
    private let ride: DisplayRide

    init(ride: DisplayRide) {
        self.ride = ride
        getStationImage()
    }

    func getStationImage() {

        guard let url = URL(string: ride.map_url)
            else { return }
        
        stationImageSubscription = NetworkManager.download(url: url)
            .tryMap ( { (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                self?.stationImage = returnedImage
                self?.stationImageSubscription?.cancel()
            })
    }
}
