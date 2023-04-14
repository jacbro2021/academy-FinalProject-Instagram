//
//  PostData.swift
//  Instagram
//
//  Created by jacob brown on 4/13/23.
//

import Foundation

class PostData {
    static var post1 = Post(image: "sausalito", likes: 298, comments: [Comment(owner: "user1", comment: "dope", likes: 1, liked: true)], caption: "Sausalito, CA", hoursSincePost: 2, owner: "j.b.22")
    
    static var post2 = Post(image: "jeep", likes: 223, comments: [], caption: "Beach driving😎", hoursSincePost: 12, owner: "j.b.22")
    
    static var post3 = Post(image: "applebees", likes: 12, comments: [], caption: "My favorite place to eat😀", hoursSincePost: 8, owner: "sal_lly22")
    
    static var post4 = Post(image: "lizard", likes: 5, comments: [], caption: "This is my pet lizard. His name is Jeff.", hoursSincePost: 16, owner: "julia37")
    
    static var post5 = Post(image: "napa", likes: 22, comments: [], caption: "Pretty morning in Napa Valley", hoursSincePost: 32, owner: "surfing_man")
    
    static var post6 = Post(image: "pebble_beach", likes: 39, comments: [], caption: "I hate playing golf at pebble beach... mostly because I am terrible at golf‼️", hoursSincePost: 64, owner: "city_boys_up27")
    
    static var post7 = Post(image: "street", likes: 41, comments: [], caption: "I run these streets... literally. I run marathons.", hoursSincePost: 128, owner: "the_seargent")
    
    static var post8 = Post(image: "vacation", likes: 18, comments: [], caption: "So excited to go on vacation!", hoursSincePost: 256, owner: "obama_44")
    
    static var post9 = Post(image: "jeep", likes: 223, comments: [], caption: "Beach driving😎", hoursSincePost: 12, owner: "j.b.22")
    
    static var post10 = Post(image: "jeep", likes: 223, comments: [], caption: "Beach driving😎", hoursSincePost: 12, owner: "j.b.22")
}
