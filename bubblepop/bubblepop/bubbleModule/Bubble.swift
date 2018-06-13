//
//  Bubble.swift
//  bubblepop
//
//  Created by _ on 2018/5/4.
//  Copyright © 2018年 cc. All rights reserved.
//

import UIKit
typealias BubbleClickBlock = (_ type:Int) -> ()
class Bubble: UIButton {
    var type:Int!{
        didSet{
            if(type == 1){
                self.backgroundColor = UIColor.red
            }else if(type == 2){
                self.backgroundColor = UIColorFromRGB(rgbValue: 0xFFAEB9, alpha: 1)
            }else if(type == 3){
                self.backgroundColor = UIColor.green
            }else if(type == 4){
                self.backgroundColor = UIColor.blue
            }else if(type == 5){
                self.backgroundColor = UIColor.black
            }
        }
    }
    var bubbleClickBlock:BubbleClickBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = frame.size.width / 2
        self.clipsToBounds = true
        self.addTarget(self, action: #selector(bubbleClick), for: .touchUpInside)
    }
    
    @objc func bubbleClick() -> Void {
        if(self.bubbleClickBlock != nil){
            self.bubbleClickBlock!(self.type)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
