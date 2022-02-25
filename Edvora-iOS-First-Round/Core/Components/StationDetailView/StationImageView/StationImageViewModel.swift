//
//  StationHomeViewModel.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import Foundation
import SwiftUI
import Combine

final class StationImageViewModel: ObservableObject {
    
    @Published var stationImage: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let ride: DisplayRide
    private let dataService: StationImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(ride: DisplayRide) {
        self.ride = ride
        self.dataService = StationImageService(ride: ride)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        
        dataService.$stationImage
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                self?.stationImage = returnedImage
            }
            .store(in: &cancellables)
        
    }
    
}
