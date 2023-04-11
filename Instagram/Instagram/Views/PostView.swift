//
//  PostView.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import SwiftUI

struct PostView: View {
    
    @StateObject var vm = PostViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    //add functionality linking to profile view here
                } label: {
                    HStack {
                        Image(vm.post.owner.profilePicture)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 50, height: 50)
                        Text(vm.post.owner.handle)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
            }
                Spacer()
                Image(systemName: "ellipsis")
                    .padding(.trailing)
            }
            
            Image(vm.post.image)
                .resizable()
                .scaledToFit()
            
            HStack {
                Button {
                    //like functionality goes here
                } label: {
                    Image(systemName: "heart")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    
                }
                Button {
                    //message functionality goes here
                } label: {
                    Image(systemName: "message")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
                Button {
                    //Dm functionality goes here???
                } label: {
                    Image(systemName: "paperplane")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
                
                Spacer()
                
                Button {
                    //bookmark functionality goes here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }
            }   .padding(.horizontal, 5)
            
            HStack {
                Text("**\(vm.post.likes)** likes")
                    .padding(5)
                Spacer()
            }
            HStack() {
                Text("**\(vm.post.owner.handle)** \(vm.post.caption)")
                Spacer()
            }.padding(.leading, 5)
                .padding(.bottom, 10)
            
            ForEach (vm.post.comments) { comment in
                HStack {
                    Text("**\(comment.owner.handle)** \(comment.comment)")
                        .padding(.leading, 5)
                    Spacer()
                    Button {
                        //add comment like functionality here
                    } label: {
                        HStack {
                            Text("\(comment.likes)")
                                .foregroundColor(.primary)
                            Image(systemName: "heart")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(.primary)
                                .padding(.trailing, 5)
                        }
                    }
                }
            }
            
            
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
