//
//  PostViewModel.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import Foundation
import SwiftUI

class PostViewModel: ObservableObject {
    @Published var post = Post(owner: Profile(handle: "j.b.22",
                                              posts: [],
                                              profilePicture: "profile_picture",
                                              bio: "livin' life",
                                              followers: [],
                                              following: []),
                               image: "applebees",
                               likes: 0,
                               comments: [
                                    Comment(owner: Profile(handle: "j.b.22",
                                                           posts: [],
                                                           profilePicture: "profile_picture",
                                                           bio: "livin' life",
                                                           followers: [],
                                                           following: []),
                                            comment: "I love applebees🧌",
                                            likes: 0),
                                    Comment(owner: Profile(handle: "apple",
                                                           posts: [],
                                                           profilePicture: "profile_picture",
                                                           bio: "livin' life",
                                                           followers: [],
                                                           following: []),
                                            comment: "REEEEEEEEEE",
                                            likes: 0)
                               ],
                               caption: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eu volutpat quam, sed iaculis nunc. Duis vehicula ultrices ligula, eget varius ante accumsan vitae. Aenean in aliquam nisl. Morbi euismod aliquam blandit. Phasellus in libero nec odio blandit viverra. Maecenas sed urna ultrices, consequat neque venenatis, cursus velit. Nam dapibus quam nec fermentum sagittis. Morbi convallis ultricies metus, et pulvinar est luctus ut. Sed placerat velit turpis, in lobortis velit tempus in.")
    
    
    
}
