//
//  UserDataService.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import Foundation
import Combine

final class UserDataService {

    @Published var user: User?

    private var userSubscription: AnyCancellable?

    init() {
        getUser()
    }

    func getUser() {

        guard let url = URL(string: "https://assessment.api.vweb.app/user")
            else { return }
        
        userSubscription = NetworkManager.download(url: url)
            .decode(type: User.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedUser in
                self?.user = returnedUser
                self?.userSubscription?.cancel()
            })
    }
}
