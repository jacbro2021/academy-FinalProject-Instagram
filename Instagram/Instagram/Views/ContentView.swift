//
//  ContentView.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ContentViewModel()
    
    var body: some View {
        TabView {
            FeedView(vm: FeedViewModel(profiles: vm.profileData.profiles,
                                       user: vm.profileData.user,
                                       profileData: vm.profileData))
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SearchView(vm: SearchViewModel(profiles: vm.profileData.profiles,
                                           profileData: vm.profileData))
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            AddPostView(vm: AddPostViewModel(vm.profileData))
                .tabItem {
                    Label("Post", systemImage: "plus.app")
                }
            
            ProfileView(vm: ProfileViewModel(profile: vm.profileData.user,
                                             profileData: vm.profileData))
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
