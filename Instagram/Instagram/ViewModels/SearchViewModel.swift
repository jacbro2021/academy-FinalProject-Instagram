//
//  SearchViewModel.swift
//  Instagram
//
//  Created by jacob brown on 4/15/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var profiles: [Profile]
    @Published var profileData: ProfileData
    
    init (profiles: [Profile], profileData: ProfileData) {
        self.profiles = profiles
        self.profileData = profileData
    }
    
    //function that takes in a search string parameter and returns an array of profiles with handles that match that search string
    //
    //params: one string
    //output: an array of profiles
    func searchProfiles(_ search: String) -> [Profile] {
        if search == "" {
            return []
        } else {
            return profiles.filter { $0.getLowercaseHandle().contains(search.lowercased()) }
        }
    }
}
