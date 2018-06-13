//
//  SetViewController.swift
//  bubblepop
//
//  Created by _ on 2018/5/4.
//  Copyright © 2018年 cc. All rights reserved.
//

import UIKit

class SetViewController: BaseViewController {
    
    var bubbleSlider:UISlider!
    var timeSlider:UISlider!
    var bubbleNum:UILabel!
    var timeNum:UILabel!
    var bubbleCount:Int = SaveTool.gainBubbleCount() > 0 ? SaveTool.gainBubbleCount(): 15
    var gameTime:Int! = SaveTool.gainGameTime() > 0 ? SaveTool.gainGameTime() : 60

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        let backView = UIButton.init(frame: CGRect.init(x: 40, y: (screenHeight - 230) / 2 - 60, width: screenWidth - 80, height: 230))
        backView.isUserInteractionEnabled = true
        backView.backgroundColor = UIColor.white
        backView.layer.cornerRadius = 10
        backView.clipsToBounds = true
        self.view.addSubview(backView)
    
        let titleLabel = UILabel()
        titleLabel.text = "设置"
        titleLabel.textColor = UIColorFromRGB(rgbValue: 0x515151, alpha: 1)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26)
        titleLabel.sizeToFit()
        titleLabel.frame = CGRect.init(x: (backView.width - titleLabel.width) / 2, y: 8, width: titleLabel.width, height: titleLabel.height)
        backView.addSubview(titleLabel)
        
        let bubbleLabel = UILabel()
        bubbleLabel.textColor = UIColorFromRGB(rgbValue: 0x515151, alpha: 1)
        bubbleLabel.text = "泡泡数量"
        bubbleLabel.sizeToFit()
        bubbleLabel.frame = CGRect.init(x: 20, y: titleLabel.bottom + 15, width: bubbleLabel.width, height: bubbleLabel.height)
        backView.addSubview(bubbleLabel)
        
        bubbleSlider = UISlider.init(frame: CGRect.init(x: 50, y: bubbleLabel.bottom + 10, width: backView.width - 100, height: 30))
        bubbleSlider.tag = 1
        bubbleSlider.addTarget(self, action: #selector(timeSliderChangeValue), for: .valueChanged)
        backView.addSubview(bubbleSlider)
        
        bubbleNum = UILabel.init(frame: CGRect.init(x: bubbleSlider.right + 5, y: bubbleSlider.top + 7, width: 40, height: 15))
        bubbleNum.textColor = UIColorFromRGB(rgbValue: 0x515151, alpha: 1)
        bubbleNum.text = String.init(format: "%d", self.bubbleCount)
        backView.addSubview(bubbleNum)
        
        let timeLabel = UILabel()
        timeLabel.text = "游戏时长"
        timeLabel.textColor = UIColorFromRGB(rgbValue: 0x515151, alpha: 1)

        timeLabel.sizeToFit()
        timeLabel.frame = CGRect.init(x: 20, y: bubbleSlider.bottom + 15, width: timeLabel.width, height: timeLabel.height)
        backView.addSubview(timeLabel)
        
        timeSlider = UISlider.init(frame: CGRect.init(x: 50, y: timeLabel.bottom + 10, width: backView.width - 100, height: 30))
        timeSlider.tag = 2
        timeSlider.addTarget(self, action: #selector(timeSliderChangeValue), for: .valueChanged)
        backView.addSubview(timeSlider)
        
        timeNum = UILabel.init(frame: CGRect.init(x: timeSlider.right + 5, y: timeSlider.top + 7, width: 40, height: 15))
        timeNum.textColor = UIColorFromRGB(rgbValue: 0x515151, alpha: 1)
        timeNum.text = String.init(format: "%d", self.gameTime)
        backView.addSubview(timeNum)

        bubbleSlider.value = Float(self.bubbleCount) / 15.0
        timeSlider.value = Float(self.gameTime) / 60.0

        let saveBtn = UIButton.init(frame: CGRect.init(x: (screenWidth - 80) / 2, y: backView.bottom + 30, width: 80, height: 30))
        saveBtn.setTitleColor(UIColorFromRGB(rgbValue: 0x515151, alpha: 1), for: .normal)
        saveBtn.setTitle("保存", for: .normal)
        saveBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        saveBtn.addTarget(self, action: #selector(saveBtnClick), for: .touchUpInside)
        self.view.addSubview(saveBtn)
    }
    
    @objc func saveBtnClick() -> Void {
        SaveTool.saveGameTime(gameTime: self.gameTime)
        SaveTool.saveBubbleCount(bubbleCount: self.bubbleCount)
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func timeSliderChangeValue(slider:UISlider) -> Void{
        if(slider.tag == 1){
            self.bubbleCount = Int(slider.value * 14) + 1
            bubbleNum.text = String.init(format: "%d", self.bubbleCount)
        }else{
            self.gameTime = Int(slider.value * 55) + 5
            timeNum.text = String.init(format: "%d", self.gameTime)
        }
    }
}
