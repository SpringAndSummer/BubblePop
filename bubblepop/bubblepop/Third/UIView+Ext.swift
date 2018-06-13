//
//  UIView+Ext.swift
//  bubblepop
//
//  Created by _ on 2018/5/4.
//  Copyright © 2018年 cc. All rights reserved.
//

import Foundation
import UIKit

extension UIView
{
    public var x:CGFloat{
        set{
            var f = self.frame
            f.origin.x = newValue
            self.frame = f
        }
        get{
            return self.frame.origin.x
        }
    }
    
    public var y:CGFloat{
        set{
            var f = self.frame
            f.origin.y = newValue
            self.frame = f
        }
        get{
            return self.frame.origin.y
        }
    }
    public var left:CGFloat{
        set{
            var f = self.frame
            f.origin.x = newValue
            self.frame = f
        }
        get{
            return self.frame.origin.x
        }
    }
    public var right:CGFloat{
        set{
            var f = self.frame
            f.origin.x = newValue - self.frame.size.width
            self.frame = f
        }
        get{
            return self.frame.origin.x+self.frame.size.width
        }
    }
    public var top:CGFloat{
        set{
            var f = self.frame
            f.origin.y = newValue
            self.frame = f
        }
        get{
            return self.frame.origin.y
        }
    }
    public var width:CGFloat{
        set{
            var f = self.frame
            f.size.width = newValue
            self.frame = f
        }
        get{
            return self.frame.size.width
        }
    }
    public var height:CGFloat
    {
        set{
            var f = self.frame
            f.size.height = newValue
            self.frame = f
        }
        get{
            return self.frame.size.height
        }
    }
    public var bottom:CGFloat
    {
        set{
            var f = self.frame
            f.origin.y = newValue - self.frame.size.width
            self.frame = f
        }
        get{
            return self.frame.origin.y + self.frame.size.height
        }
    }
    public func circleView()->Void
    {
        self.layer.cornerRadius = self.width * 0.5;
        self.clipsToBounds = true
    }
}
