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
            
            UserProfileTitleView(user: user)
                        
            FilterTabView(selectedTab: $vm.selectedTab)
            
            Spacer()
            
            switch vm.selectedTab {
            case .nearest:
                Text("NEAREST")
            case .upcoming:
                Text("UPCOMING")
            case .past:
                Text("PAST")
            }
            Spacer()
//                ScrollView{
//                    ForEach(vm.allRides) { ride in
//                        Text("\(ride.id) + \(ride.state)")
//                            .frame(maxWidth: .infinity)
//                    }
//                }
            }
         else {
            ProgressView()
        }
    }
}

struct StationHomeView_Previews: PreviewProvider {
    static var previews: some View {
        StationHomeView()
    }
}
