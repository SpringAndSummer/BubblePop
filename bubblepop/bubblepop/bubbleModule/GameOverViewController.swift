//
//  GameOverViewController.swift
//  bubblepop
//
//  Created by _ on 2018/5/4.
//  Copyright © 2018年 cc. All rights reserved.
//

import UIKit

class GameOverViewController: BaseViewController {
    var userName:String?
    var score:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gameOver = UILabel.init(frame: CGRect.init(x: 0, y: self.view.center.y - 200, width: screenWidth, height: 150))
        gameOver.font = UIFont.italicSystemFont(ofSize: 40)
        gameOver.textAlignment = .center
        gameOver.text = "Game Over"
        self.view.addSubview(gameOver)
        
        let userName = UILabel.init(frame: CGRect.init(x: 0, y: gameOver.bottom , width: screenWidth, height: 35))
        userName.font = UIFont.italicSystemFont(ofSize: 25)
        userName.textColor = UIColor.lightGray
        userName.textAlignment = .center
        userName.text = self.userName
        self.view.addSubview(userName)
        
        let scoreLabel = UILabel.init(frame: CGRect.init(x: 0, y: userName.bottom + 20 , width: screenWidth, height: 60))
        scoreLabel.font = UIFont.italicSystemFont(ofSize: 25)
        scoreLabel.textColor = UIColorFromRGB(rgbValue: 0x707070, alpha: 1)
        scoreLabel.textAlignment = .center
        scoreLabel.numberOfLines = 0
        scoreLabel.text = String.init(format: "Score\n%d", self.score!)
        self.view.addSubview(scoreLabel)
        
        let backBtn = UIButton.init(frame: CGRect.init(x: (screenWidth - 80) / 2, y: scoreLabel.bottom + 20, width: 60, height: 60))
        backBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        backBtn.backgroundColor = UIColor.blue
        backBtn.layer.cornerRadius = 30
        backBtn.clipsToBounds = true
        backBtn.setImage(UIImage.init(named: "end"), for: .normal)
        self.view.addSubview(backBtn)
    }
    
    @objc func backBtnClick() -> Void {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
