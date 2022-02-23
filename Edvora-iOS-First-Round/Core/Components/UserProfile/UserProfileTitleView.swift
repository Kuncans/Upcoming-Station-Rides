//
//  UserProfileTitleView.swift
//  Edvora-iOS-First-Round
//
//  Created by Duncan Kent on 23/02/2022.
//

import SwiftUI

struct UserProfileTitleView: View {
    
    let user: User
    
    var body: some View {
        HStack {
            
            Text("Edvora")
                .fontWeight(.bold)
                .font(.system(size: 44))
                .padding(.leading, 20)
            
            Spacer()
            
            UserImageView(user: user)
                .padding(.trailing, 26.15)
            
        }
        .padding(.top, 20)
        
    }
}

struct UserProfileTitleView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileTitleView(user: MockUser.devUser)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
