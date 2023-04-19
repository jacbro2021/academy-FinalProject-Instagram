//
//  AddPostViewModel.swift
//  Instagram
//
//  Created by jacob brown on 4/16/23.
//

import Foundation
import SwiftUI
import UIKit

class AddPostViewModel: ObservableObject {
    
    @Published var profileData: ProfileData
    @ObservedObject var sampleData: ProfileData
    
    init(profileData: ProfileData, sampleData: ProfileData) {
        self.profileData = profileData
        self.sampleData = sampleData
    }
    
    func post(image: UIImage, caption: String) {
        let post = Post(image: Image(uiImage: image),
                        likes: 0, comments: [],
                        caption: caption,
                        hoursSincePost: 0,
                        owner: profileData.user.handle)
        sampleData.user.posts.append(post)
        
    }
}




//struct that handles selecting an image from the camera roll
//or using the camera
struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) ->
    UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //leave alone for right now
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
