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
    @Published var profileData: ProfileData
    @Published var likedPost: Bool
    
    //init class
    init(post: Post, owner: Profile, profileData: ProfileData) {
        self.post = post
        self.owner = owner
        self.profileData = profileData
        self.likedPost = post.userLikedPost
    }
    
    //increments the like count for the post
    //
    //params: none
    //output: none; changes post like count
    func incrementLikeCount() {
        post.likes += 1
        post.userLikedPost = true
    }
    
    //decrement the like count for the post
    //
    //params: none
    //output: none; changes post like count
    func decrementLikeCount() {
        post.likes -= 1
        post.userLikedPost = false
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
    
    //returns a boolean indicating if the view should show the time since post in hours or days (true for days, false for hours)
    //
    //params: int representing the hours since the post was uploaded
    //output: boolean indicating if the time should be represented in hours or days
    func showHoursOrDays(_ hours: Int) -> Bool {
        return hours % 24 > 0
    }
    
    //returns the necessary time stamp for a given post
    //
    //params: time in hours since the post was made
    //output: time string with the correct formatting
    func timeString(_ hours: Int) -> String {
        if hours == 0 {
            return "just now"
        } else if showHoursOrDays(hours) {
            let days = hours % 24
            return "\(days) days ago"
        } else {
            return "\(hours) hours ago"
        }
    }
}
