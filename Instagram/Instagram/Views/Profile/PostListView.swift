//
//  PostListView.swift
//  Instagram
//
//  Created by jacob brown on 4/14/23.
//

import SwiftUI

struct PostListView: View {
    
    @StateObject var vm: ProfileViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(vm.profile.posts) { post in
                    PostView(vm: PostViewModel(post: post, owner: vm.profile))
                }
            }
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(vm: ProfileViewModel())
    }
}
