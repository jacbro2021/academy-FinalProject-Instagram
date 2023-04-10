//
//  ProfileModel.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import Foundation

struct Profile: Identifiable {
    let id = UUID()
    let posts: [Post]
    let followers: [Profile]
    let following: [Profile]
}
