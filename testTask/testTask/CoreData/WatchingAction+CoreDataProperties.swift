//
//  WatchingAction+CoreDataProperties.swift
//  testTask
//
//  Created by Ihor on 15.11.2022.
//
//

import Foundation
import CoreData


extension WatchingAction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WatchingAction> {
        return NSFetchRequest<WatchingAction>(entityName: "WatchingAction")
    }

    @NSManaged public var watchTime: Date?
    @NSManaged public var item: WatchedItem?

}

extension WatchingAction : Identifiable {

}
