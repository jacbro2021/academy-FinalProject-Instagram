//
//  PostModel.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import Foundation
import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let image: Image
    var likes: Int
    var comments: [Comment]
    let caption: String
    let hoursSincePost: Int
    let owner: String
    var userLikedPost = false
}
