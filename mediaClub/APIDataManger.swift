//
//  APIDataManger.swift
//  mediaClub
//
//  Created by asmaa gamal  on 28/11/2023.
//

import Foundation
class APIDataManger{
    static let shared : APIDataManger = APIDataManger()
    func getImages(complition:@escaping(Bool,[ImageModel])->()){
        let decoder = JSONDecoder()
        let url = "https://api.unsplash.com/photos?client_id=6VPG5CltZnpFlSU41xc4LY3Wjtsmbq3KCCosN7ivMkQ"
        NetworkManger.shared.ApiRequest(url: url) { bool, data in
            if let jsonData = data {
                do{
                    let result = try decoder.decode([ImageModel].self, from: jsonData )
                    complition(true,result)
                }catch {
                    print(error)
                    
                    complition(false,[])
                }
            }
            
        }
        
    }
   
}
