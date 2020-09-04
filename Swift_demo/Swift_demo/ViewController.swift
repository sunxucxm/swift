//
//  ViewController.swift
//  Swift_demo
//
//  Created by 孙旭 on 2019/4/20.
//  Copyright © 2019 sunxu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView?
    var titleArray = ["UIView","UILabel","UIButton","UIImageView","UITextFild","UITextView","UIPickView","UICollectionView","UITableView","代理","闭包","扩展","可失败构造器"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Swift功能清单"
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 375, height: 812), style: UITableView.Style.plain)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(tableView!)

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = titleArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var vc: UIViewController
        switch indexPath.row {
        case 0:
            vc = ViewVC()
        case 1:
            vc = LabelVC()
        case 2:
            vc = ButtonVC()
        case 3:
            vc = ImageViewVC()
        case 4:
            vc = TextFildVC()
        case 5:
            vc = TextVeiwVC()
        case 6:
            vc = TextVeiwVC()
        case 7:
            vc = CollectionViewVC()
        case 8:
            vc = TbaleViewViewController()
        case 9:
            vc = DelegateVC()
        case 10:
            vc = ClosureVC()
        case 11:
            vc = ExtensionVC()
        default:
            vc = ClosureVC()
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

}





//68E400
