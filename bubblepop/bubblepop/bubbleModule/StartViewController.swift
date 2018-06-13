//
//  StarViewController.swift
//  bubblepop
//
//  Created by _ on 2018/5/4.
//  Copyright © 2018年 cc. All rights reserved.
//

import UIKit
typealias StartDismissBlock = () -> ()
class StartViewController: BaseViewController {

    var timer:Timer?
    var timeLabel:UILabel!
    var timeSum:Int = 3
    var dismissBlock:StartDismissBlock?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bgImage.image = nil
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        self.timeLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 150, height: 150))
        self.timeLabel.center = self.view.center
        self.timeLabel.font = UIFont.systemFont(ofSize: 130)
        self.timeLabel.textAlignment = .center
        self.timeLabel.textColor = UIColor.lightGray
        self.view.addSubview(self.timeLabel)
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true)
    }
    
    @objc func timerCount() -> Void {
        if(self.timeSum <= 0){
            self.timer?.invalidate()
            self.timer = nil
            self.dismiss(animated: false) {
                if(self.dismissBlock != nil){
                    self.dismissBlock!()
                }
            }
        }else{
            self.timeLabel.text = String.init(format: "%d", self.timeSum)
        }
        self.timeSum = self.timeSum - 1
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}
