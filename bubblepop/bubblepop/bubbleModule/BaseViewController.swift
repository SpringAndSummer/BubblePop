//
//  BaseViewController.swift
//  bubblepop
//
//  Created by _ on 2018/5/4.
//  Copyright © 2018年 cc. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var bgImage:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    
        self.bgImage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: screenWidth, height: screenHeight))
        self.bgImage.contentMode = .scaleAspectFill
        self.bgImage.clipsToBounds = true
        self.bgImage.image = UIImage.init(named: "cavas.jpg")
        self.view.addSubview(self.bgImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
