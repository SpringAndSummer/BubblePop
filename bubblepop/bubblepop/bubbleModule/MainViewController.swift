//
//  MainViewController.swift
//  bubblepop
//
//  Created by _ on 2018/5/4.
//  Copyright © 2018年 cc. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    var iconPop:UIImageView!
    var gameName:UILabel!

    var textField:UITextField!
    var beginBtn:UIButton!
    var rankBtn:UIButton!
    var setBtn:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()        
        self.iconPop = UIImageView.init(frame: CGRect.init(x: (screenWidth - 250) / 2, y: 100, width: 250, height: 130))
        self.view.addSubview(self.iconPop)
        
        self.gameName = UILabel.init(frame: self.iconPop.bounds)
        self.gameName.textAlignment = .center
        self.gameName.numberOfLines = 0
        self.gameName.textColor = UIColorFromRGB(rgbValue: 0x363636, alpha: 1)
        self.gameName.font = UIFont.italicSystemFont(ofSize: 45)
        self.gameName.text = "Bubble\nPop"
        self.iconPop.addSubview(self.gameName)
        
        self.textField = UITextField.init(frame: CGRect.init(x: (screenWidth - 150) / 2, y: self.iconPop.bottom + 8, width: 150, height: 35))
        self.textField.layer.borderColor = UIColor.lightGray.cgColor
        self.textField.tintColor = UIColor.lightGray
        self.textField.layer.borderWidth = 1
        self.textField.layer.cornerRadius = 2
        self.textField.clipsToBounds = true
        self.textField.placeholder = "USERNAME"
        self.textField.textAlignment = .center
        self.view.addSubview(self.textField)

        self.beginBtn = self.initButton(type: 1)
        self.beginBtn.layer.cornerRadius = 40
        self.beginBtn.clipsToBounds = true
        self.beginBtn.frame = CGRect.init(x: view.center.x - 40, y: self.textField.bottom + 30, width: 80, height: 80)
        self.view.addSubview(self.beginBtn)

        self.rankBtn = self.initButton(type: 2)
        
        self.rankBtn.layer.cornerRadius = 30
        self.rankBtn.clipsToBounds = true
        self.rankBtn.frame = CGRect.init(x: self.view.center.x - 60 - 40, y: self.beginBtn.bottom + 20, width: 60, height: 60)
        self.view.addSubview(self.rankBtn)
        
        self.setBtn = self.initButton(type: 3)
        
        self.setBtn.layer.cornerRadius = 30
        self.setBtn.clipsToBounds = true
        self.setBtn.frame = CGRect.init(x: self.view.center.x + 40, y: self.beginBtn.bottom + 20, width: 60, height: 60)
        self.view.addSubview(self.setBtn)
    }

    func initButton(type:Int) -> UIButton {
        let btn = UIButton.init()
        if(type == 1){
            btn.setImage(UIImage.init(named: "begin"), for: .normal)
        }else if(type == 2){
            btn.setImage(UIImage.init(named: "rank"), for: .normal)
        }else{
            btn.setImage(UIImage.init(named: "setting"), for: .normal)
        }
        btn.tag = type
        btn.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside)
        return btn
    }
    
    @objc func btnClick(sender:UIButton) -> Void {
        self.textField.resignFirstResponder()
        let tag = sender.tag
        if(tag == 1){
            if(self.textField.text?.count == 0){
                return
            }
            let start = StartViewController()
            start.modalPresentationStyle = .overCurrentContext
            start.dismissBlock = {
                let game = GameViewController()
                game.userName = self.textField.text
                self.navigationController?.pushViewController(game, animated: false)
            }
            self.present(start, animated: false, completion: nil)
        }else if(tag == 2){
                let rankVC = RankListViewController()
                self.navigationController?.pushViewController(rankVC, animated: true)
        }else{
            let set = SetViewController()
            set.modalPresentationStyle = .overCurrentContext
            self.present(set, animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.resignFirstResponder()
    }
}
