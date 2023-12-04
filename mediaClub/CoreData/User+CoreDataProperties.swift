//
//  User+CoreDataProperties.swift
//  mediaClub
//
//  Created by asmaa gamal  on 28/11/2023.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var name: String?
    @NSManaged public var favs: NSSet?

}

// MARK: Generated accessors for favs
extension User {

    @objc(addFavsObject:)
    @NSManaged public func addToFavs(_ value: Favourit)

    @objc(removeFavsObject:)
    @NSManaged public func removeFromFavs(_ value: Favourit)

    @objc(addFavs:)
    @NSManaged public func addToFavs(_ values: NSSet)

    @objc(removeFavs:)
    @NSManaged public func removeFromFavs(_ values: NSSet)

}

extension User : Identifiable {

}
