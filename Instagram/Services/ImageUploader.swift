//
//  ImageUploader.swift
//  Instagram
//
//  Created by PRACHIKA AGARWAL on 11/04/24.
//

import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader{
    static func uploadImage(image: UIImage) async throws -> String?{
        
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return nil}
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        
        do{
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("Debud: Failed to upload image \(error.localizedDescription)")
            return nil
        }
        
    }
}
