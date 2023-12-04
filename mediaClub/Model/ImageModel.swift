//
//  ImageModel.swift
//  mediaClub
//
//  Created by asmaa gamal  on 28/11/2023.
//

import Foundation
struct ImageModel:Codable , Hashable{
    let id:String
    let urls: ImageUrls
    static func == (lhs: ImageModel, rhs: ImageModel) -> Bool {
        return lhs.id == rhs.id
    }
}

struct ImageUrls:Codable , Hashable{
    let raw:String
    let full:String
    let small:String
}
