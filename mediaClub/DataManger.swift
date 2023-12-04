//
//  DataManger.swift
//  mediaClub
//
//  Created by asmaa gamal  on 28/11/2023.
//

import Foundation
import CoreData
class DataManger{
  static let shared = DataManger()
    
    private init(){
        
    }
    lazy var persistentContainer: NSPersistentContainer = {
           let container = NSPersistentContainer(name: "mediaClub")
           container.loadPersistentStores { description, error in
               if let error = error {
                   fatalError("Unable to load persistent stores: \(error)")
               }else{
                   print("loaded")
               }
           }
           return container
       }()

    func addUser(name:String){
        if let entity =  NSEntityDescription.entity(forEntityName: "User", in: persistentContainer.viewContext){
            let user = NSManagedObject(entity: entity, insertInto: persistentContainer.viewContext)
            
            user.setValue(name, forKey: name)
            
            do {
                
                try persistentContainer.viewContext.save()
                print("user saved")
            }catch{
                print(error)
            }
            
        }
    }
//    func fetchUSer() {
//        
//    }
    
    
}
