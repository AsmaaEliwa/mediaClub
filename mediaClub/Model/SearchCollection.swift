//
//  SearchCollection.swift
//  mediaClub
//
//  Created by asmaa gamal  on 07/12/2023.
//

import Foundation


struct UnsplashCoverPhoto: Codable , Hashable {
    let id: String
    let urls: UnsplashPhotoURLs

}

struct UnsplashPhotoURLs: Codable ,Hashable{
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
 
}
struct LinksModel:Codable ,Hashable{
    let photos:String
}
struct UserModel:  Codable, Hashable{
    let links: LinksModel
    let id:String
    let username:String
}

struct CollectionModel: Codable, Hashable , Identifiable  {
    static func == (lhs: CollectionModel, rhs: CollectionModel) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: String
    let title: String
    let description: String?
    let published_at: String
    let last_collected_at: String
    let updated_at: String
    let featured: Bool
    let total_photos: Int
    let share_key: String
    let cover_photo: UnsplashCoverPhoto
    let user : UserModel

}

struct CollectionsResponse: Codable, Hashable {
    let total: Int
    let total_pages: Int
    let results: [CollectionModel]
   


}
