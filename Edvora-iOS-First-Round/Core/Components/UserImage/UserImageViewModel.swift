//
//  StationHomeViewModel.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import Foundation
import SwiftUI
import Combine

final class UserImageViewModel: ObservableObject {
    
    @Published var userImage: UIImage? = nil
    
    private let user: User
    private let dataService: UserImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(user: User) {
        self.user = user
        self.dataService = UserImageService(user: user)
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        
        dataService.$userImage
            .sink { [weak self] returnedImage in
                self?.userImage = returnedImage
            }
            .store(in: &cancellables)
        
    }
    
}
