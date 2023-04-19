//
//  AddPostView.swift
//  Instagram
//
//  Created by jacob brown on 4/13/23.
//

import SwiftUI

struct AddPostView: View {
    
    @StateObject var vm: AddPostViewModel
    @State var caption = ""
    @State var changePostImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    @Binding var changeTab: String
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    Text("New Post")
                        .font(.title3)
                        .fontWeight(.medium)
                        .padding(.leading, 50)
                    Spacer()
                    Button {
                        vm.post(image: imageSelected, caption: caption)
                        changePostImage = false
                        caption = ""
                        changeTab = "home"
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
                        .frame(width: 250, height: 100, alignment: .center)
                        .padding()
                }
                
                Group {
                    Divider()
                    
                    Button {
                        //add tagging functionality
                    } label: {
                        HStack {
                            Text("Tag People")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }   .padding(.horizontal)
                            .foregroundColor(.primary)
                    }
                    
                    Divider()
                    
                    Button {
                        //add tagging functionality
                    } label: {
                        HStack {
                            Text("Add location")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }   .padding(.horizontal)
                            .foregroundColor(.primary)
                    }
                    
                    Divider()
                    
                    Button {
                        //add tagging functionality
                    } label: {
                        HStack {
                            Text("add Music")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }   .padding(.horizontal)
                            .foregroundColor(.primary)
                    }
                    
                    Divider()
                    
                    Button {
                        //add tagging functionality
                    } label: {
                        HStack {
                            Text("Add fundraiser")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }   .padding(.horizontal)
                            .foregroundColor(.primary)
                    }
                }
                
                Spacer()
                
            }.sheet(isPresented: $openCameraRoll) {
                ImagePicker(selectedImage: $imageSelected,sourceType: .photoLibrary)
            }
        }
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        @State var fake = ""
        AddPostView(vm: AddPostViewModel(profileData: ProfileData(),
                                         sampleData: ProfileData()),
                                         changeTab: $fake)
    }
}
