//
//  SaveTool.swift
//  bubblepop
//
//  Created by _ on 2018/5/5.
//  Copyright © 2018年 cc. All rights reserved.
//

import UIKit

class SaveTool: NSObject {
    
    class func saveBubbleCount(bubbleCount:Int) -> Void {
        UserDefaults.standard.set(bubbleCount, forKey: "BubbleCount")
        UserDefaults.standard.synchronize()
    }
    
    class func saveGameTime(gameTime:Int) -> Void {
        UserDefaults.standard.set(gameTime, forKey: "GameTime")
        UserDefaults.standard.synchronize()
    }
    
    class func gainBubbleCount() -> Int {
        return UserDefaults.standard.integer(forKey: "BubbleCount")
    }
    
    class func gainGameTime() -> Int {
        return UserDefaults.standard.integer(forKey: "GameTime")
    }
}
