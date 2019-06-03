//
//  TbaleViewViewController.swift
//  Swift_demo
//
//  Created by 孙旭 on 2019/5/7.
//  Copyright © 2019 sunxu. All rights reserved.
//

import UIKit

class TbaleViewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    var tableView: UITableView?
    var tableHeadView: UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 375, height: 812), style: UITableView.Style.grouped)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.register(TableViewTableViewCell.self, forCellReuseIdentifier:"cell")
        self.view.addSubview(self.tableView!)
        
        self.tableHeadView = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 100))
        self.tableHeadView?.backgroundColor = UIColor.red
        self.tableView?.tableHeaderView = self.tableHeadView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 100))
        view.backgroundColor = UIColor.blue
        return view
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 100))
        view.backgroundColor = UIColor.red
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

  

}
