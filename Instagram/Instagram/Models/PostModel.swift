//
//  PostModel.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import Foundation

struct Post: Identifiable {
    let id = UUID()
    let owner: Profile
    let image: String
    let likes: Int
    let comments: [Comment]
    let caption: String
}
