//
//  CommentModel.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import Foundation

struct Comment: Identifiable {
    let id = UUID()
    let owner: String
    let comment: String
    var likes: Int
    var liked: Bool
}
