//
//  PostGridView.swift
//  Instagram
//
//  Created by jacob brown on 4/14/23.
//

import SwiftUI

struct PostGridView: View {
    
    @StateObject var vm: ProfileViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    let ImageDimension = UIScreen.main.bounds.width / 3
    
    var body: some View {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach (vm.profile.posts) { post in
                        NavigationLink {
                            PostView(vm: PostViewModel(post: post,
                                                       owner: vm.profile,
                                                       profileData: vm.profileData))
                        } label: {
                            Image(post.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: ImageDimension, height: ImageDimension)
                                .clipped()
                        }
                        .padding(.top, 3)
                    }
                }
            }  
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView(vm: ProfileViewModel(profile: ProfileData().user,
                                          profileData: ProfileData()))
    }
}
