//
//  StationImageView.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 24/02/2022.
//

import SwiftUI

struct StationImageView: View {
    
    @StateObject var vm: StationImageViewModel
    
    init(ride: Ride) {
        _vm = StateObject(wrappedValue: StationImageViewModel(ride: ride))
    }
    
    var body: some View {
        
        ZStack {
            if let image = vm.stationImage {
                Image(uiImage: image)
                    .resizable()

            } else {
                Image("MockImage")
                    .resizable()

            }
        }
    }
}

struct StationImageView_Previews: PreviewProvider {
    static var previews: some View {
        StationImageView(ride: MockRide.devRide)
    }
}
