//
//  NetworkManger.swift
//  mediaClub
//
//  Created by asmaa gamal  on 28/11/2023.
//

import Foundation
 
class NetworkManger{
    static let shared:NetworkManger = NetworkManger()
    private init(){
        
    }
    
    func ApiRequest(url:String , compilation: @escaping(Bool,Data?)->()){
        guard  let requestUrl = URL(string:url) else {
            return
        }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.timeoutInterval = 30.0
        request.cachePolicy = .useProtocolCachePolicy
        
        let task = URLSession.shared.dataTask(with: request ,completionHandler:  {( data, response, error )in
            
            if data != nil {
                compilation(true, data)
            }else {
                compilation(false, nil)
            }
            
            
            
            
        })
        
        task.resume()
    }
    
    
    
}
