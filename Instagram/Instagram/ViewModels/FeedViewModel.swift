//
//  ContentViewModel.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import Foundation
import SwiftUI

class FeedViewModel: ObservableObject {
     
    @ObservedObject var profileData: ProfileData
    
    init(profileData: ProfileData) {
        self.profileData = profileData
    }
    
    //sorts posts for display in the feed
    //
    //params: array of Profiles
    //output: sorted array of posts
    func sortedPosts(profiles: [Profile]) -> [Post] {
        var posts: [Post] = []
        for profile in profiles {
            for post in profile.posts {
                posts.append(post)
            }
        }
        for post in profileData.user.posts {
            posts.append(post)
        }
        
        var sortedPosts: [Post] = []
        while (posts.count != 0) {
            var lowestTime = posts[0].hoursSincePost
            var appendPost = posts[0]
            for post in posts {
                if post.hoursSincePost < lowestTime {
                    lowestTime = post.hoursSincePost
                    appendPost = post
                }
            }
            sortedPosts.append(appendPost)
            
            var index = 0
            for post in posts {
                if post.hoursSincePost == lowestTime {
                    posts.remove(at: index)
                    break;
                }
                index += 1
            }
        }
        
        return sortedPosts
    }
    
    //matches a post to a given profile
    //
    //params: a post
    //output: the profile that maps to that post
    func matchProfileToPost(post: Post) -> Profile {
        for profile in profileData.profiles {
            if profile.handle == post.owner {
                return profile
            }
        }
        return profileData.user
    }
}
