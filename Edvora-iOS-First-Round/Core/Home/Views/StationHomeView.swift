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
    @State var viewState = CGSize(width: 0, height: 800)
    
    var body: some View {
        
        if let user = vm.user {
            
            ZStack {
                VStack {
                    UserProfileTitleView(user: user)
                                
                    FilterTabView(selectedTab: $vm.selectedTab, showingFilterModal: $vm.showingFilterModal)
                        .disabled(detailViewPresented ? true : false)
                    
                    ridesList
                        .blur(radius: detailViewPresented ? 10 : 0)
                        .animation(.easeInOut(duration: 0.3), value: detailViewPresented)

                }
                .animation(.spring(), value: viewState)
                .onTapGesture {
                    self.viewState = CGSize(width: 0, height: 800)
                    detailViewPresented = false
                }
                
                    VStack {
                        Spacer()
                        
                        StationDetailView(ride: vm.selectedRide ?? MockRide.devRide)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(y: viewState.height + 200)
                            .animation(.easeInOut, value: viewState)
                            .onTapGesture {
                                self.viewState = CGSize(width: 0, height: 800)
                                detailViewPresented = false
                            }
                            .gesture(
                                DragGesture()
                                    .onChanged({ value in
                                        self.viewState = value.translation
                                    })
                                    .onEnded({ value in
                                        if self.viewState.height > 200 {
                                            self.viewState = CGSize(width: 0, height: 800)
                                            detailViewPresented = false
                                        } else {
                                            self.viewState = .zero
                                        }
                                    })
                            )
                    }.edgesIgnoringSafeArea(.all)
                    
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
                        self.viewState = .zero
                    }
                
            }
            .padding(.horizontal)
        }
        .disabled(detailViewPresented ? true : false)
        .padding(.top, 28)
    }
}
