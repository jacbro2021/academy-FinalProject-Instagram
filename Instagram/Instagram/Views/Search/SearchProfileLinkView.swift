//
//  SearchProfileLinkView.swift
//  Instagram
//
//  Created by jacob brown on 4/15/23.
//

import SwiftUI

struct SearchProfileLinkView: View {

    @StateObject var vm: ProfileViewModel
    
    var body: some View {
        HStack {
            NavigationLink {
                ProfileView(vm: vm)
            } label: {
                HStack {
                    Image(vm.profile.profilePicture)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(vm.profile.handle)
                            .foregroundColor(.primary)
                            .font(.headline)
                        HStack {
                            Text(vm.profile.name)
                                .foregroundColor(.primary)
                                .fontWeight(.light)
                            Text("·")
                                .fontWeight(.heavy)
                                .foregroundColor(.primary)
                            Text("\(vm.profile.followers.count) followers")
                                .foregroundColor(.primary)
                                .fontWeight(.light)
                        }
                    }
                }
            }   .padding(.horizontal, 10)
            Spacer()
        }
    }
}

struct SearchProfileLinkView_Previews: PreviewProvider {
    static var previews: some View {
        let profData = ProfileData()
        SearchProfileLinkView(vm: ProfileViewModel(profile: profData.user, profileData: profData))
    }
}
