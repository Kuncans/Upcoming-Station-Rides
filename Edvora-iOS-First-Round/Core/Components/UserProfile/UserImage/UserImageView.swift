//
//  UserImageView.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 22/02/2022.
//

import SwiftUI

struct UserImageView: View {
    
    @StateObject var vm: UserImageViewModel
    
    init(user: User) {
        _vm = StateObject(wrappedValue: UserImageViewModel(user: user))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.userImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 41.59)
                    .clipShape(Circle())
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UserImageView_Previews: PreviewProvider {
    static var previews: some View {
        UserImageView(user: MockUser.devUser)
    }
}
