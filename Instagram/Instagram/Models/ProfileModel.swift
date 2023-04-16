//
//  ProfileModel.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import Foundation

struct Profile: Identifiable {
    let id = UUID()
    let name: String
    var handle: String
    var posts: [Post]
    var profilePicture: String
    var bio: String
    var followers: [Profile]
    var following: [Profile]
    
    //returns true if found, else returns false
    //
    //params: Profile struct
    //output: -1 if not found, index of profile in followers if found
    func findFollower(_ follower: Profile) -> Bool {
        if followers.contains(where: {$0.handle == follower.handle}) {
           return true
        } else {
           return false
        }
    }
    
    //returns true if found, else returns false
    //
    //params: Profile struct
    //output: -1 if not found, index of profile in following if found
    func findFollowing(_ fing: Profile) -> Bool {
        if following.contains(where: {$0.handle == fing.handle}) {
           return true
        } else {
           return false
        }
    }
    
    //returns the lowercased version of the profiles handle
    //
    //params: none
    //output: the lowercased handle of the profile
    func getLowercaseHandle() -> String {
        return handle.lowercased()
    }
}
