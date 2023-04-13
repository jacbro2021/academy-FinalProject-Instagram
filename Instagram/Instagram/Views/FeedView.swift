//
//  SwiftUIView.swift
//  Instagram
//
//  Created by jacob brown on 4/13/23.
//

import SwiftUI

struct SwiftUIView: View {
    
    @StateObject var vm = FeedViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Instagram")
                        .font(.custom("Billabong", size: 50))
                        .padding(.horizontal, 15)
                    
                    Spacer()
                    
                    Button{
                        //add functionality here
                    } label: {
                        Image(systemName: "plus.app")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }.padding(.horizontal, 5)
                    
                    Button{
                        //add functionality here
                    } label: {
                        Image(systemName: "heart")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }.padding(.horizontal, 5)
                    
                    Button {
                        //add functionality here
                    } label: {
                        Image(systemName: "message")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }.padding(.horizontal, 5)
                }
                
                Spacer()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(vm.profiles) { profile in
                                VStack {
                                    VStack {
                                        Button {
                                            //add functionality here
                                        } label: {
                                            Image(profile.profilePicture)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 60, height: 60)        
                                                .cornerRadius(50)
                                        }
                                    } .overlay {
                                        Circle()
                                            .stroke(LinearGradient(colors: [.red, .purple, .red, .orange, .yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.3)
                                            .frame(width: 68, height: 68)
                                        
                                    }
                                    Text("\(profile.handle)")
                                        .font(.caption)
                                }.padding(5)
                            }
                        }
                    }
                    
                    ForEach(vm.sortedPosts(profiles: vm.profiles)) { post in
                        PostView(vm: PostViewModel(post: post, owner: vm.matchProfileToPost(post: post)))
                    }
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}