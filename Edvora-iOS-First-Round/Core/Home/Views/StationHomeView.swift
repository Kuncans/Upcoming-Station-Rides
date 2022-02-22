//
//  StationHomeView.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import SwiftUI

struct StationHomeView: View {
    
    @StateObject private var vm = StationHomeViewModel()
    
    var body: some View {
        
        if let user = vm.user {
            VStack {
                Text(user.name)
                Text(user.url)
                Text("\(user.station_code)")
            }
        } else {
            ProgressView()
        }
    }
}

struct StationHomeView_Previews: PreviewProvider {
    static var previews: some View {
        StationHomeView()
    }
}
