//
//  AddCommentView.swift
//  Instagram
//
//  Created by jacob brown on 4/11/23.
//

import SwiftUI

struct AddCommentView: View {
    
    @StateObject var vm: PostViewModel
    @State var newComment = ""
    
    var body: some View {
        VStack {
            ForEach(vm.post.comments) { comment in
                CommentView(vm: CommentViewModel(comment: comment))
            }
            
            Spacer()
            
            HStack {
                TextField("add a comment", text: $newComment)
                    .padding(20)
                Button {
                    vm.appendComment(comment: newComment)
                    newComment = ""
                } label: {
                    Text("Post")
                }   .padding(.trailing)
            }   .textFieldStyle(.roundedBorder)
                
        }   .padding(.top, 20)
    }
}

struct AddCommentView_Previews: PreviewProvider {
    static var previews: some View {
        AddCommentView(vm: PostViewModel(post: ProfileData().user.posts[0],
                                         owner: ProfileData().user,
                                         profileData: ProfileData()))
    }
}
