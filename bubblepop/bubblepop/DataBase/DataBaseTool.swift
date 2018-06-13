//
//  DataBaseTool.swift
//  bubblepop
//
//  Created by Spring on 2018/5/10.
//  Copyright © 2018年 UTS. All rights reserved.
//

import UIKit
import CoreData

class DataBaseTool: NSObject {

    class func getAllUser() -> [User] {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<User>(entityName:"User")
        let sort = NSSortDescriptor.init(key: "score", ascending: false)
        fetchRequest.sortDescriptors = [sort]
        do {
            let fetchedObjects = try context.fetch(fetchRequest)
            return fetchedObjects
        }
        catch {
            fatalError("fearchAllUser error：\(error)")
        }
    }
    
    class func saveScore(_ userName:String, _ score:Int) -> Void {
        let app:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
        user.score = Int16(score)
        user.userName = userName
        do {
            try context.save()
        } catch {
            fatalError("saveScore error：\(error)")
        }
    }
}
