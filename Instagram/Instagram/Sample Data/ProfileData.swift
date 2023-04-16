//
//  ProfileData.swift
//  Instagram
//
//  Created by jacob brown on 4/13/23.
//

import Foundation

class ProfileData {
    var profiles: [Profile]
    var user: Profile
    
    init() {
        
        //init user profile
        var user0 = Profile(name: "Jacob Brown",
                            handle: "j.b.22",
                            posts: [PostData.post1, PostData.post2, PostData.post9, PostData.post10],
                            profilePicture: "profile_picture",
                            bio: "student @ UNC Chapel Hill",
                            followers: [],
                            following: [])
        
        //init sample users
        var user1 = Profile(name: "Sal Lilbertson",
                            handle: "sal_lly22",
                            posts: [PostData.post3],
                            profilePicture: "child",
                            bio: "I love ice cream",
                            followers: [],
                            following: [])
        
        var user2 = Profile(name: "Julia McLoser",
                            handle: "julia37",
                            posts: [PostData.post4],
                            profilePicture: "girl1",
                            bio: "I love to read",
                            followers: [],
                            following: [])
        
        var user3 = Profile(name: "Jimmy John",
                            handle: "surfing_man",
                            posts: [PostData.post5],
                            profilePicture: "guy1",
                            bio: "yellow is my favorite color",
                            followers: [],
                            following: [])
        
        var user4 = Profile(name: "Chuck Clodfelter",
                            handle: "city_boys_up27",
                            posts: [PostData.post6],
                            profilePicture: "guy2",
                            bio: "Coolest dude in NYC",
                            followers: [],
                            following: [])
        
        var user5 = Profile(name: "Ricky Bobby",
                            handle: "the_seargent",
                            posts: [PostData.post7],
                            profilePicture: "guy3",
                            bio: "I enjoy yelling at people",
                            followers: [],
                            following: [])
        
        var user6 = Profile(name: "Barrack Obama", handle: "obama_44",
                            posts: [PostData.post8],
                            profilePicture: "obama",
                            bio: "former POTUS. I also have a great jumpshot",
                            followers: [],
                            following: [])
        
        //creating a "social network"
        relation(following: &user0, follower: &user1)
        relation(following: &user0, follower: &user2)
        relation(following: &user0, follower: &user3)
        relation(following: &user0, follower: &user4)
        relation(following: &user0, follower: &user6)
        relation(following: &user1, follower: &user5)
        relation(following: &user1, follower: &user2)
        relation(following: &user1, follower: &user4)
        relation(following: &user2, follower: &user0)
        relation(following: &user2, follower: &user3)
        relation(following: &user2, follower: &user1)
        relation(following: &user3, follower: &user0)
        relation(following: &user3, follower: &user6)
        relation(following: &user4, follower: &user0)
        relation(following: &user4, follower: &user1)
        relation(following: &user4, follower: &user6)
        relation(following: &user4, follower: &user2)
        relation(following: &user5, follower: &user0)
        relation(following: &user6, follower: &user0)
        relation(following: &user6, follower: &user1)
        relation(following: &user6, follower: &user2)
        
        //assigning data to fields
        var data: [Profile] = []
        data.append(user1)
        data.append(user2)
        data.append(user3)
        data.append(user4)
        data.append(user5)
        data.append(user6)
        
        self.profiles = data
        self.user = user0
    }
}

//establishes a "relation" between two profiles
//
//params: two profile addresses
//output: none; modifies the follower and following arrays of the given profiles
func relation(following: inout Profile, follower: inout Profile) {
    following.followers.append(follower)
    follower.following.append(following)
}
