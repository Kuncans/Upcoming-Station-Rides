//
//  UserImageService.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import Foundation
import SwiftUI
import Combine

final class UserImageService {

    @Published var userImage: UIImage? = nil

    private var imageSubscription: AnyCancellable?
    private let user: User

    init(user: User) {
        self.user = user
        getUserImage()
    }

    func getUserImage() {

        guard let url = URL(string: user.url)
            else { return }
        
        imageSubscription = NetworkManager.download(url: url)
            .tryMap ( { (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                self?.userImage = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
