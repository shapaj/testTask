//
//  WatchedItem+CoreDataProperties.swift
//  testTask
//
//  Created by Ihor on 15.11.2022.
//
//

import Foundation
import CoreData


extension WatchedItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WatchedItem> {
        return NSFetchRequest<WatchedItem>(entityName: "WatchedItem")
    }

    @NSManaged public var title: String?
    @NSManaged public var keyIndex: Int32
    @NSManaged public var watchingCount: Int32
    @NSManaged public var watchingAction: NSSet?

}

// MARK: Generated accessors for watchingAction
extension WatchedItem {

    @objc(addWatchingActionObject:)
    @NSManaged public func addToWatchingAction(_ value: WatchingAction)

    @objc(removeWatchingActionObject:)
    @NSManaged public func removeFromWatchingAction(_ value: WatchingAction)

    @objc(addWatchingAction:)
    @NSManaged public func addToWatchingAction(_ values: NSSet)

    @objc(removeWatchingAction:)
    @NSManaged public func removeFromWatchingAction(_ values: NSSet)

}

extension WatchedItem : Identifiable {

}
