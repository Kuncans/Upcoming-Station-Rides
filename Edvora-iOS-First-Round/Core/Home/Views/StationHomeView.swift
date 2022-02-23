//
//  StationHomeView.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import SwiftUI

struct StationHomeView: View {
    
    @StateObject private var vm = StationHomeViewModel()
    @State private var detailViewPresented = false
    
    var body: some View {
        
        if let user = vm.user {
            
            VStack {
                UserProfileTitleView(user: user)
                            
                FilterTabView(selectedTab: $vm.selectedTab, showingFilterModal: $vm.showingFilterModal)
                
                ridesList
                
//
//                switch vm.selectedTab {
//                case .nearest:
//                    Text("NEAREST")
//                case .upcoming:
//                    Text("UPCOMING")
//                case .past:
//                    Text("PAST")
//                }
            }
            .sheet(isPresented: $detailViewPresented, onDismiss: vm.dismissSelectedRide) {
                if let ride = vm.selectedRide {
                    StationInfoView(ride: ride)
                }
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

extension StationHomeView {
    
    private var ridesList: some View {
        ScrollView {
            ForEach(vm.allRides) { ride in
                StationInfoView(ride: ride)
                    .padding(.bottom, 30)
                    .onTapGesture {
                        detailViewPresented = true
                        vm.selectedRide = ride
                    }
            }
            .padding(.horizontal)
        }
        .padding(.top, 28)
    }
}
