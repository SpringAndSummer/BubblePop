//
//  RankListViewController.swift
//  bubblepop
//
//  Created by Spring on 2018/5/10.
//  Copyright © 2018年 UTS. All rights reserved.
//

import UIKit

class RankListViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    var dataArray:[User]?
    override func viewDidLoad() {
        super.viewDidLoad()

        let titleLabel = UILabel.init(frame: CGRect.init(x: 0, y: 20, width: screenWidth, height: 44))
        titleLabel.text = "Rank"
        titleLabel.font = UIFont.systemFont(ofSize: 22)
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)
        
        let backBtn = UIButton.init(frame: CGRect.init(x: 10, y: 20, width: 44, height: 44))
        backBtn.setTitle("Back", for: .normal)
        backBtn.setTitleColor(UIColor.black, for: .normal)
        backBtn.addTarget(self, action: #selector(backBtnClick), for: .touchUpInside)
        self.view.addSubview(backBtn)
        
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: titleLabel.bottom, width: screenWidth, height: screenHeight - titleLabel.height), style: .plain)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = 50
        self.tableView.separatorColor = UIColor.black
        self.tableView.backgroundColor = UIColor.clear
        self.dataArray = DataBaseTool.getAllUser()
        self.view.addSubview(self.tableView)
        self.tableView.register(RankListTableViewCell.self, forCellReuseIdentifier: "RankListTableViewCell")
        self.tableView.tableFooterView = UIView()
    }
    @objc func backBtnClick() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.dataArray?.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RankListTableViewCell", for: indexPath) as! RankListTableViewCell
        let user:User = self.dataArray![indexPath.row]
        cell.user = user
        return cell
    }
}
