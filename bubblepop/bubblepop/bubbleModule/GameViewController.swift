//
//  GameViewController.swift
//  bubblepop
//
//  Created by _ on 2018/5/4.
//  Copyright © 2018年 cc. All rights reserved.
//

import UIKit
let bubbleWidth:CGFloat = 80
class GameViewController: BaseViewController {

    var timer:Timer?
    var timeSum:Float = SaveTool.gainGameTime() > 0 ? Float(SaveTool.gainGameTime()) : 60.0
    var timeAll:Float = SaveTool.gainGameTime() > 0 ? Float(SaveTool.gainGameTime()) : 60.0
    
    var bubbleArray:[Bubble] = [Bubble]()
    var lastX:CGFloat = 0
    var scoreSum:Int = 0
    
    var previousBubble:Bubble?

    var bubbleSum = SaveTool.gainBubbleCount() > 0 ? SaveTool.gainBubbleCount(): 15
    var userName:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0..<bubbleSum {
            let frame = CGRect.init(x: 100, y: 300, width: bubbleWidth, height: bubbleWidth)
            let tmpBubble = Bubble.init(frame: frame)
            tmpBubble.bubbleClickBlock = { (type) in
                tmpBubble.isHidden = true
                if let lastBubble = self.previousBubble{
                    if(lastBubble.type == type){
                        if(type == 1){
                            self.scoreSum = self.scoreSum + Int(Double(1) * 1.5)
                        }else if(type == 2){
                            self.scoreSum = self.scoreSum + Int(Double(2) * 1.5)
                        }else if(type == 3){
                            self.scoreSum = self.scoreSum + Int(Double(5) * 1.5)
                        }else if(type == 4){
                            self.scoreSum = self.scoreSum + Int(Double(8) * 1.5)
                        }else if(type == 5){
                            self.scoreSum = self.scoreSum + Int(Double(10) * 1.5)
                        }
                    }else{
                        if(type == 1){
                            self.scoreSum = self.scoreSum + 1
                        }else if(type == 2){
                            self.scoreSum = self.scoreSum + 2
                        }else if(type == 3){
                            self.scoreSum = self.scoreSum + 5
                        }else if(type == 4){
                            self.scoreSum = self.scoreSum + 8
                        }else if(type == 5){
                            self.scoreSum = self.scoreSum + 10
                        }
                    }
                }else{
                    if(type == 1){
                        self.scoreSum = self.scoreSum + 1
                    }else if(type == 2){
                        self.scoreSum = self.scoreSum + 2
                    }else if(type == 3){
                        self.scoreSum = self.scoreSum + 5
                    }else if(type == 4){
                        self.scoreSum = self.scoreSum + 8
                    }else if(type == 5){
                        self.scoreSum = self.scoreSum + 10
                    }
                }
                self.scoreLabel.text = String.init(format: "%d", self.scoreSum)
            }
            tmpBubble.isHidden = true
            tmpBubble.type = self.createBubbleColor()
            self.bubbleArray.append(tmpBubble)
            self.view.addSubview(tmpBubble)
        }
        self.view.addSubview(self.scoreLabel)
        self.view.addSubview(self.progress)
        self.view.addSubview(self.timeLabel)
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerCount), userInfo: self, repeats: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.timer?.invalidate()
        self.timer = nil
    }
    lazy var scoreLabel:UILabel! = { () -> UILabel in
        let label = UILabel.init(frame: CGRect.init(x: screenWidth - 100, y: 0, width: 100, height: 100))
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.text = "0"
        return label
    }()
    
    lazy var progress:UIProgressView! = { () -> UIProgressView in
        let progress = UIProgressView.init(frame: CGRect.init(x: 30, y: 50, width: 200, height: 100))
        progress.clipsToBounds = true
        progress.progress = 1.0
        progress.trackTintColor = UIColor.black
        progress.progressTintColor = UIColor.red
        progress.transform = CGAffineTransform(scaleX: 1.0, y: 10.0)
        return progress
    }()
    
    lazy var timeLabel:UILabel! = { () -> UILabel in
        let timeLabel = UILabel.init(frame: CGRect.init(x: 20, y: 30, width: 40, height: 40))
        timeLabel.backgroundColor = UIColor.black
        timeLabel.font = UIFont.systemFont(ofSize: 20)
        timeLabel.textColor = UIColor.white
        timeLabel.textAlignment = .center
        timeLabel.layer.cornerRadius = timeLabel.width / 2
        timeLabel.clipsToBounds = true
        return timeLabel
    }()
    
    @objc func timerCount() -> Void {
        self.timeSum = self.timeSum - 0.5
        print(self.timeSum / self.timeAll)
        self.progress.progress = self.timeSum / self.timeAll
        self.timeLabel.text = String.init(format: "%d", Int(self.timeSum))
        if(self.timeSum <= 0){
            self.timer?.invalidate()
            self.timer = nil
            
            DataBaseTool.saveScore(self.userName!, self.scoreSum)

            let gameOver = GameOverViewController()
            gameOver.userName = self.userName
            gameOver.score = self.scoreSum
            self.navigationController?.pushViewController(gameOver, animated: false)
            return
        }
        for bubble in self.bubbleArray{
            if(bubble.isHidden == true){
                bubble.isHidden = false
                var x =  CGFloat(Int(arc4random())%Int(screenWidth - bubbleWidth)) + bubbleWidth / 2
                let bubbleY =  -bubbleWidth / 2

                while (self.distance(center: CGPoint.init(x: x, y: bubbleY)) == true){
                    x =  CGFloat(Int(arc4random())%Int(screenWidth - bubbleWidth)) + bubbleWidth / 2
                }
                lastX = x
                bubble.frame = CGRect.init(x: lastX, y: -bubbleWidth, width: bubbleWidth, height: bubbleWidth)
                bubble.type = self.createBubbleColor()
                let beginTime = CGFloat(Int(arc4random()) % 350) / 100.0
                if let anim = POPBasicAnimation.init(propertyNamed: kPOPViewCenter) {
                    anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
                    anim.fromValue = NSValue.init(cgPoint: CGPoint.init(x: x, y: bubbleY))
                    anim.toValue = NSValue.init(cgPoint: CGPoint.init(x: x, y: screenHeight + bubbleWidth / 2))
                    anim.duration = CFTimeInterval(4)
                    anim.beginTime = CFTimeInterval(beginTime)
                    bubble.pop_add(anim, forKey: "kPOPViewCenter")
                }
                return
            }else{
                if(bubble.top >= screenHeight){
                    bubble.isHidden = true
                }
            }
        }
    }
    
    func createBubbleColor() -> Int {
        let arc = arc4random_uniform(100)
        if(arc < 40){
            return 1
        }else if(40 <= arc && arc < 70){
            return 2
        }else if(70 <= arc && arc < 85){
            return 3
        }else if(85 <= arc && arc < 95){
            return 4
        }else{
            return 5
        }
    }
    
    func distance(center:CGPoint) -> Bool {
        for bubble in self.bubbleArray {
           let point1 = bubble.center
           let d = sqrt(pow((point1.x - center.x), 2) + pow((point1.y - center.y), 2))
           if(d - 10 <= bubbleWidth){
                return true
           }
        }
        return false
    }
}
