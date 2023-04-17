//
//  AddPostView.swift
//  Instagram
//
//  Created by jacob brown on 4/13/23.
//

import SwiftUI

struct AddPostView: View {
    
    @State var caption = ""
    @State var changePostImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("New Post")
                    .font(.title3)
                    .fontWeight(.medium)
                    .padding(.leading, 50)
                Spacer()
                Button {
                    //add post functionality here
                } label: {
                    Text("Post")
                        .padding(.trailing)
                        .font(.headline)
                }
            }
            HStack {
                Button {
                    changePostImage = true
                    openCameraRoll = true
                } label: {
                    if changePostImage == true {
                        Image(uiImage: imageSelected)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFill()
                    } else {
                        VStack {
                            Image(systemName: "camera.fill")
                                .foregroundColor(.primary)
                                .font(.title)
                            Text("add Image")
                                .foregroundColor(.primary)
                                .font(.caption)
                        }
                    }
                }
        
                TextField("Write a caption...", text: $caption, axis: .vertical)
                    .frame(width: 250, height: 100, alignment: .topLeading)
                    .padding()
            }
            Spacer()
        }.sheet(isPresented: $openCameraRoll) {
            ImagePicker(selectedImage: $imageSelected,sourceType: .photoLibrary)
        }
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
