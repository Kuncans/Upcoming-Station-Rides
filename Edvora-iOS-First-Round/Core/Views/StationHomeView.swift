//
//  StationHomeView.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import SwiftUI

struct StationHomeView: View {
    
    @StateObject var vM = NetworkUserService()
    
    var body: some View {
        Text(vM.user?.name ?? "")
    }
}

struct StationHomeView_Previews: PreviewProvider {
    static var previews: some View {
        StationHomeView()
    }
}
