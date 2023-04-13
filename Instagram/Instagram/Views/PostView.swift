//
//  PostView.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import SwiftUI

struct PostView: View {
    
    @StateObject var vm: PostViewModel
    @State var likedPost = false
    @State var bookmarked = false
    @State var commentSheet = false
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    //add functionality linking to profile view here
                } label: {
                    Image(vm.owner.profilePicture)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                    Text(vm.owner.handle)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
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
                    if likedPost {
                        vm.decrementLikeCount()
                        likedPost.toggle()
                    } else {
                        vm.incrementLikeCount()
                        likedPost.toggle()
                    }
                } label: {
                    if likedPost {
                        Image(systemName: "heart.fill")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.red)
                    } else {
                        Image(systemName: "heart")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }
                }
                
                Button {
                    commentSheet.toggle()
                } label: {
                    Image(systemName: "message")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }.sheet(isPresented: $commentSheet) {
                    AddCommentView(vm: vm)
                }
                
                Button {} label: {
                    Image(systemName: "paperplane")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                }.sheet(isPresented: $commentSheet) {
                    AddCommentView(vm: vm)
                }
                
                Spacer()
                
                Button {
                    bookmarked.toggle()
                } label: {
                    Image(systemName: bookmarked ? "bookmark.fill" : "bookmark")
                        .font(.title2)
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
                Text("**\(vm.owner.handle)** \(vm.post.caption)")
                Spacer()
            }.padding(.leading, 5)
                .padding(.bottom, 10)
            
            HStack {
                if vm.post.comments.count > 0 {
                    Button {
                        commentSheet.toggle()
                    } label: {
                        Text(vm.post.comments.count > 1 ? "\(vm.post.comments.count) Comments" : "\(vm.post.comments.count) Comment")
                            .padding(.leading, 5)
                            .foregroundColor(.primary)
                            .opacity(0.5)
                    }.sheet(isPresented: $commentSheet) {
                        AddCommentView(vm: vm)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(vm: PostViewModel(post: ProfileData().user.posts[0], owner: ProfileData().user))
    }
}
