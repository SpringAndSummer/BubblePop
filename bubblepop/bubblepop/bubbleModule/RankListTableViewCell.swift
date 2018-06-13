//
//  RankListTableViewCell.swift
//  bubblepop
//
//  Created by Spring on 2018/5/10.
//  Copyright © 2018年 UTS. All rights reserved.
//

import UIKit

class RankListTableViewCell: UITableViewCell {

    
    var userNameLabel:UILabel!
    var userScoreLabel:UILabel!
    var user:User!{
        didSet{
            self.userNameLabel.text = user.userName
            self.userScoreLabel.text = String.init(format: "%d", user.score)
            self.setNeedsLayout()
        }
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        self.userNameLabel = UILabel()
        self.contentView.addSubview(self.userNameLabel)
        self.userScoreLabel = UILabel()
        self.contentView.addSubview(self.userScoreLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.userNameLabel.sizeToFit()
        self.userNameLabel.frame = CGRect.init(x: 10, y: (self.contentView.height - self.userNameLabel.height), width: self.userNameLabel.width, height: self.userNameLabel.height)
        
        self.userScoreLabel.sizeToFit()
        self.userScoreLabel.frame = CGRect.init(x: (self.contentView.width - 10 - self.userScoreLabel.width), y: (self.contentView.height - self.userScoreLabel.height), width: self.userScoreLabel.width, height: self.userScoreLabel.height)
    }
}
