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
    let owner: Profile
    let image: Image
    let likes: Int
    let comments: [Comment]
}
