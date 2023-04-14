//
//  ProfileViewModel.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var profile: Profile
    @Published var user: Profile
    @Published var userIsFollowing: Bool
    
    //init class
    init(_ profile: Profile = ProfileData().user) {
        self.profile = profile
        self.user = ProfileData().user
        self.userIsFollowing = ProfileData().user.findFollowing(profile)
    }
    
    //returns false if the profile to be loaded is the users profile, true otherwise
    //
    //params: none
    //output: boolean indicating if the profile to be loaded belongs to the user
    func isNotUsersProfile() -> Bool {
        return !(profile.handle == user.handle)
    }
    
    //follows or unfollows profile
    //
    //params: none
    //output: none
    func followProfile() {
        if user.findFollowing(profile) == false && profile.findFollower(user) == false {
            user.following.append(profile)
            profile.followers.append(user)
        } else {
            user.following.removeAll(where: {$0.handle == profile.handle})
            profile.followers.removeAll(where: {$0.handle == user.handle})
        }
        userIsFollowing = user.findFollowing(profile)
    }
}
