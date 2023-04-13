//
//  ContentView.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            SwiftUIView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            AddPostView()
                .tabItem {
                    Label("Post", systemImage: "plus.app")
                }
            
            ProfileView()
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
