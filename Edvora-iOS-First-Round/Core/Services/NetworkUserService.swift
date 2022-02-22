//
//  NetworkUserService.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import SwiftUI
import Combine

final class NetworkUserService: ObservableObject {
    
    @Published var user: User?
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getUser()
    }
    
    func getUser() {
        
        guard let url = URL(string: "https://assessment.api.vweb.app/user")
        else {
            //TODO: ALERT ON FAIL TO LOAD URL
            return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                        throw URLError(.badServerResponse)
                    }
                return data
            }
            .decode(type: User.self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("Call Completed")
                case .failure(let error):
                    print("Error \(error)")
                }
            } receiveValue: { [weak self] returnedUser in
                self?.user = returnedUser
            }
            .store(in: &cancellables)
            

    }
    
}


