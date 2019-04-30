//
//  LabelVC.swift
//  Swift_demo
//
//  Created by 孙旭 on 2019/4/21.
//  Copyright © 2019 sunxu. All rights reserved.
//

import UIKit

class LabelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.title = "label"
        
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.text = "label"
        label.backgroundColor = UIColor.yellow
        label.textAlignment = NSTextAlignment.right
        self.view.addSubview(label)

    }


}
