//
//  CommentModel.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import Foundation

struct Comment: Identifiable {
    let id = UUID()
    let owner: Profile
    let comment: String
    let likes: Int
}
