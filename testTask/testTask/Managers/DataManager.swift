//
//  DataManager.swift
//  testTask
//
//  Created by Ihor on 14.11.2022.
//

import Foundation
import CoreData

class DataManager {
    
    var persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext
    
    init() {
        let container = NSPersistentContainer(name: "testTask")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        persistentContainer = container
        viewContext = container.viewContext
    }
    
    func newWatching(index: Int, time: Date) {
        
        let newWatching  = WatchingAction(context: viewContext)
        newWatching.watchTime = time
        newWatching.item = getWatchedItems(index: index)
        
        if let item = newWatching.item {
            increaseCountOfWatching(item: item)
        }
        
        do {
            try viewContext.save()
        } catch let error {
            print(error)
        }
    }
    
    func getCurrentInfo(index: Int, complition: (WatchedItem) -> Void) {
        complition(getWatchedItems(index: index))
    }
    
    private func getWatchedItems(index: Int) -> WatchedItem {
        
        let fetchReuest =
        NSFetchRequest<NSFetchRequestResult>(entityName: "WatchedItem")
        
        fetchReuest.predicate = NSPredicate(format: "keyIndex = " + String(index))
        
        if let watchedItems = try? viewContext.fetch(fetchReuest) as? [WatchedItem],
           let watchedItem = watchedItems.first {
            return watchedItem
        }
        
        let watchedItem = WatchedItem(context: viewContext)
        watchedItem.title = "page" + String(index)
        watchedItem.keyIndex = Int32(index)
        watchedItem.watchingCount = 0
        
        do {
            try viewContext.save()
        } catch let error {
            print(error)
        }
        
        return watchedItem
    }
    
    private func increaseCountOfWatching(item: WatchedItem) {
        item.watchingCount += 1
    }
}
