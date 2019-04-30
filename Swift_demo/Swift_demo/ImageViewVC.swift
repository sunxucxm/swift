//
//  ImageViewVC.swift
//  Swift_demo
//
//  Created by 孙旭 on 2019/4/28.
//  Copyright © 2019 sunxu. All rights reserved.
//

import UIKit

class ImageViewVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "icon_empty")
        imageView.layer.cornerRadius = 10;
        imageView.clipsToBounds = true
        self.view.addSubview(imageView)
        
    }

}

