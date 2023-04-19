//
//  ContentView.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ContentViewModel()
    @StateObject var sampleData = ProfileData()
    @State var selection = "home"
    
    var body: some View {
        TabView(selection: $selection) {
            FeedView(vm: FeedViewModel(profileData: sampleData))
                .tabItem {
                    Label("Home", systemImage: "house")
                }.tag("home")
            
            SearchView(vm: SearchViewModel(profiles: vm.profileData.profiles,
                                           profileData: vm.profileData))
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }.tag("search")
            
            AddPostView(vm: AddPostViewModel(profileData: vm.profileData,
                                             sampleData: sampleData),
                                             changeTab: $selection)
                .tabItem {
                    Label("Post", systemImage: "plus.app")
                }.tag("post")
            
            ProfileView(vm: ProfileViewModel(profile: sampleData.user,
                                             profileData: sampleData))
                .tabItem {
                    Label("Profile", systemImage: "person")
                }.tag("profile")
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
