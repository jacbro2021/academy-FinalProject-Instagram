//
//  ContentViewModel.swift
//  Instagram
//
//  Created by jacob brown on 4/14/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var profileData: ProfileData
    
    //init
    init(_ profileData: ProfileData = ProfileData()) {
        self.profileData = profileData
    }
}
