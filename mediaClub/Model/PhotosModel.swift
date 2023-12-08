//
//  PhotosModel.swift
//  mediaClub
//
//  Created by asmaa gamal  on 07/12/2023.
//

import Foundation


struct PhotoModel: Codable, Hashable {
    let id: String?
    let urls: PhotoUrls?
    // Add other properties from your JSON if needed
    
    enum CodingKeys: String, CodingKey {
        case id
        case urls
        // Add other keys as needed
    }
}

struct PhotoUrls: Codable, Hashable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
    let smallS3: String
    
    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
