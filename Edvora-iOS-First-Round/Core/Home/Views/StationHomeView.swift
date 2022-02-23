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
                UserProfileTitleView(user: user)
                            
                FilterTabView(selectedTab: $vm.selectedTab, showingFilterModal: $vm.showingFilterModal)
                
                if vm.showingFilterModal {
                    Text("show modal")
                } else {
                    Text("close modal")
                }
                
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
            }
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
