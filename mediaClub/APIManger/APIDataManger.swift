//
//  APIDataManger.swift
//  mediaClub
//
//  Created by asmaa gamal  on 28/11/2023.
//

import Foundation
class APIDataManger{
    static let shared : APIDataManger = APIDataManger()
    private init(){
        
    }
    

    
    func getImages(complition:@escaping(Bool,[ImageModel])->()){
        let decoder = JSONDecoder()
//        let key = "6VPG5CltZnpFlSU41xc4LY3Wjtsmbq3KCCosN7ivMkQ"
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
    
    func searchForImages(query: String, completion: @escaping (SearchResponse?) -> Void) {
        let url = "https://api.unsplash.com/search/photos?query=\(query)&client_id=6VPG5CltZnpFlSU41xc4LY3Wjtsmbq3KCCosN7ivMkQ"
        let decoder = JSONDecoder()
        
        NetworkManger.shared.ApiRequest(url: url) { success, data in
            if success, let jsonData = data {
                do {
                    let result = try decoder.decode(SearchResponse.self, from: jsonData)
                    completion(result)
                } catch {
                    print(error)
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }

    
    func searchCollectionOfImages(query: String,page:Int ,completion: @escaping ([CollectionModel?]) -> Void) {
        let url = "https://api.unsplash.com/search/collections?page=\(page)&query=\(query)&client_id=6VPG5CltZnpFlSU41xc4LY3Wjtsmbq3KCCosN7ivMkQ"
        
        let decoder = JSONDecoder()
        
        NetworkManger.shared.ApiRequest(url: url) { success, data in
            if success, let jsonData = data {
                do {
                    let result = try decoder.decode(CollectionsResponse.self, from: jsonData)
                    completion(result.results)
                } catch {
                    print(error)
                    completion([])
                }
            } else {
                completion([])
            }
        }
    }
    
    
    
    
    
   
}
