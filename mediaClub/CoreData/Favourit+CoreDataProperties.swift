//
//  Favourit+CoreDataProperties.swift
//  mediaClub
//
//  Created by asmaa gamal  on 28/11/2023.
//
//

import Foundation
import CoreData


extension Favourit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favourit> {
        return NSFetchRequest<Favourit>(entityName: "Favourit")
    }

    @NSManaged public var imageUrl: String?
    @NSManaged public var user: User?

}

extension Favourit : Identifiable {

}
