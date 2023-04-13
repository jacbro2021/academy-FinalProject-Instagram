//
//  CommentView.swift
//  Instagram
//
//  Created by jacob brown on 4/11/23.
//

import SwiftUI

struct CommentView: View {
    
    @StateObject var vm: CommentViewModel
    
    var body: some View {
        HStack {
            Text("**\(vm.comment.owner)** \(vm.comment.comment)")
                .padding(.leading, 5)
            Spacer()
            Button {
                if vm.comment.liked {
                    vm.decrementLikes()
                } else {
                    vm.incrementLikes()
                }
            } label: {
                HStack {
                    Text("\(vm.comment.likes)")
                        .foregroundColor(.primary)
                    if vm.comment.liked {
                        Image(systemName: "heart.fill")
                            .font(.title3)
                            .fontWeight(.medium)
                            .foregroundColor(.red)
                            .padding(.trailing, 5)
                    } else {
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

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(vm: CommentViewModel(comment: PostData.post1.comments[0]))
    }
}
