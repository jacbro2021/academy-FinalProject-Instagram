//
//  ProfileView.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var vm: ProfileViewModel
    @State var postView = "grid"
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text(vm.profile.handle)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button {} label: {
                        Image(systemName: "plus.app")
                            .foregroundColor(.primary)
                            .font(.title)
                    }   .padding(.trailing)
                    
                    Button {} label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.primary)
                            .font(.title)
                    }
                    
                }   .padding(10)
                
                HStack(spacing: 10) {
                    Button {} label: {
                        Image(vm.profile.profilePicture)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .padding(.leading)
                            .overlay {
                                Circle()
                                    .stroke(LinearGradient(colors: [.red, .purple, .red, .orange, .yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.3)
                                    .frame(width: 110, height: 110)
                                    .offset(CGSize(width: 8.0, height: 0))
                            }
                    }
                    Spacer()
                    
                    Button {
                        //add functionality here
                    } label: {
                        VStack {
                            Text("\(vm.profile.posts.count)")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Text("Posts")
                                .foregroundColor(.primary)
                        }   .padding(.horizontal, 5)
                    }
                    
                    Button {
                        //add functionality here
                    } label: {
                        VStack {
                            Text("\(vm.profile.followers.count)")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Text("Followers")
                                .foregroundColor(.primary)
                        }   .padding(.horizontal, 5)
                    }
                    
                    Button {
                        //add functionality here
                    } label: {
                        VStack {
                            Text("\(vm.profile.following.count)")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            Text("Following")
                                .foregroundColor(.primary)
                        }   .padding(.trailing)
                    }
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(vm.profile.name)
                            .font(.headline)
                            .padding(.leading, 10)
                            .padding(.top, 5)
                        Text(vm.profile.bio)
                            .padding(.leading, 10)
                    }
                    
                    Spacer()
                }
                
                if (vm.isNotUsersProfile()) {
                    Button {
                        vm.followProfile()
                    } label: {
                        Text(vm.userIsFollowing ? "Following" : "Follow")
                            .frame(width: 350, height:  35)
                            .foregroundColor(.white)
                            .background(.primary)
                            .cornerRadius(5)
                            .padding(10)
                    }
                }
                
                Picker("", selection: $postView) {
                    Image(systemName: "squareshape.split.3x3").tag("grid")
                    Image(systemName: "line.3.horizontal").tag("list")
                }
                .pickerStyle(.segmented)
                
                if postView == "grid" {
                    PostGridView()
                } else {
                    PostListView()
                }
                
                
                
                Spacer()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(vm: ProfileViewModel())
    }
}
