//
//  SearchResponse.swift
//  mediaClub
//
//  Created by asmaa gamal  on 04/12/2023.
//

import Foundation
struct SearchResponse:Codable{
    let total: Int
    let total_pages:Int
    let results: [searchModel]
}

struct searchModel:Codable{
    let id:String
    let urls: SearchUrls
}

struct SearchUrls:Codable{
    let regular:String
    let small:String
}
