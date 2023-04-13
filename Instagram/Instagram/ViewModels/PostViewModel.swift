//
//  PostViewModel.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import Foundation
import SwiftUI

class PostViewModel: ObservableObject {
    @Published var post: Post
    @Published var owner: Profile
    
    //init class
    init(post: Post, owner: Profile) {
        self.post = post
        self.owner = owner
    }
    
    //increments the like count for the post
    //
    //params: none
    //output: none; changes post like count
    func incrementLikeCount() {
        post.likes += 1
    }
    
    //decrement the like count for the post
    //
    //params: none
    //output: none; changes post like count
    func decrementLikeCount() {
        post.likes -= 1
    }
    
    //appends comment to comment array of post
    //
    //params: string that represents the new comment
    //output: none; appends new comment
    func appendComment(comment: String) {
        post.comments.append(Comment(owner: ProfileData().user.handle,
                                     comment: comment,
                                     likes: 0,
                                     liked: false))
    }
}
