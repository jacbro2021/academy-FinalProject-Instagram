//
//  PostView.swift
//  Instagram
//
//  Created by jacob brown on 4/10/23.
//

import SwiftUI

struct PostView: View {
    
    @StateObject var vm: PostViewModel
    @State private var likedPost = false
    @State private var animate = false
    @State private var likeAnimation = false
    @State private var bookmarked = false
    @State private var commentSheet = false
    private let duration: Double = 0.2
    private var animationScale: CGFloat{
        likedPost ? 0.8 : 1.2
    }
    
    func performAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1500)) {
            likeAnimation = false
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                NavigationLink {
                    ProfileView(vm: ProfileViewModel(profile: vm.owner,
                                                     profileData: vm.profileData))
                } label: {
                    Image(vm.owner.profilePicture)
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                        .padding(.leading, 10)
                    Text(vm.owner.handle)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                Spacer()
                Image(systemName: "ellipsis")
                    .padding(.trailing)
            }
            
            ZStack {
                vm.post.image
                    .resizable()
                    .scaledToFit()
                    .onTapGesture(count: 2) {
                        likeAnimation = true
                        performAnimation()
                        likedPost.toggle()
                        if likedPost {
                            vm.post.likes += 1
                        } else {
                            vm.post.likes -= 1
                        }
                    }
                Image(systemName: likeAnimation ? "heart.fill" : "")
                    .scaleEffect(likeAnimation ? 1 : 0)
                    .opacity(likeAnimation ? 1 : 0)
                    .animation(.spring())
                    .foregroundColor(.white)
                    .font(.custom("heartSize", fixedSize: 75))
            }
            
            HStack {
                Button {
                    if likedPost {
                        self.animate = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + self.duration, execute: {
                            self.animate = false
                            likedPost.toggle()
                        })
                        vm.decrementLikeCount()
                    } else {
                        vm.incrementLikeCount()
                        self.animate = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + self.duration, execute: {
                            self.animate = false
                            likedPost.toggle()
                        })
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
                }   .scaleEffect(animate ? animationScale : 1)
                    .animation(.easeIn(duration: duration))
                
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
            }   .padding(.horizontal, 10)
            
            HStack {
                Text("**\(vm.post.likes)** likes")
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                Spacer()
            }
            
            HStack() {
                Text("**\(vm.owner.handle)** \(vm.post.caption)")
                Spacer()
            }   .padding(.leading, 10)
                
               
            
            HStack {
                if vm.post.comments.count > 0 {
                    Button {
                        commentSheet.toggle()
                    } label: {
                        Text(vm.post.comments.count > 1 ? "\(vm.post.comments.count) Comments" : "\(vm.post.comments.count) Comment")
                            .padding(.vertical, 1)
                            .padding(.horizontal, 10)
                            .foregroundColor(.primary)
                            .opacity(0.5)
                    }.sheet(isPresented: $commentSheet) {
                        AddCommentView(vm: vm)
                    }
                }
                
                Spacer()
            }
            HStack {
                Text(vm.timeString(vm.post.hoursSincePost))
                    .padding(.leading, 12)
                    .foregroundColor(.primary)
                    .opacity(0.50)
                    .font(.caption2)
                Spacer()
            }
            Spacer()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(vm: PostViewModel(post: ProfileData().user.posts[0],
                                   owner: ProfileData().user,
                                   profileData: ProfileData()))
    }
}
