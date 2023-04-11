//
//  ProfileModel.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import Foundation

struct Profile: Identifiable {
    let id = UUID()
    var handle: String
    var posts: [Post]
    var profilePicture: String
    var bio: String
    var followers: [Profile]
    var following: [Profile]
}
