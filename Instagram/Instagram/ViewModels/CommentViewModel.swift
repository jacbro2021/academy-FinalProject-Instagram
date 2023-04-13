//
//  CommentViewModel.swift
//  Instagram
//
//  Created by jacob brown on 4/11/23.
//

import Foundation

class CommentViewModel: ObservableObject {
    @Published var comment: Comment
    
    //init class
    init(comment: Comment) {
        self.comment = comment
    }
    
    //increments the likes for the given comment
    //
    //params: none
    //output: increments like count for comment
    func incrementLikes() {
        comment.likes += 1
        comment.liked = true
    }
    
    //decrements the likes for the given comment
    //
    //params: none
    //output: decrements like count for comment
    func decrementLikes() {
        comment.likes -= 1
        comment.liked = false
    }
}
