//
//  SearchView.swift
//  Instagram
//
//  Created by jacob brown on 4/13/23.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var vm: SearchViewModel
    @State var search = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(vm.searchProfiles(search)) { profile in
                        SearchProfileLinkView(vm: ProfileViewModel(profile: profile, profileData: vm.profileData))
                            .navigationBarTitleDisplayMode(.inline)
                    }
                }.searchable(text: $search)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let profData = ProfileData()
        SearchView(vm: SearchViewModel(profiles: profData.profiles, profileData: profData))
    }
}
