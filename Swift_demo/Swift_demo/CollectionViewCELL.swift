
//
//  CollectionViewCELL.swift
//  Swift_demo
//
//  Created by sunxu on 2019/4/30.
//  Copyright © 2019 sunxu. All rights reserved.
//

import UIKit


class CollectionViewCELL :UICollectionViewCell{
    var titleLabel:UILabel?//title
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 30))
        titleLabel?.layer.cornerRadius = 4
        titleLabel?.layer.borderWidth = 0.5
        titleLabel?.text = "dddd"
        titleLabel?.textAlignment = NSTextAlignment.center
        titleLabel?.layoutMargins = UIEdgeInsets(top:0, left:0, bottom:0, right:0)
        self .addSubview(titleLabel!)
    }
    //about Inheritance
    //http://stackoverflow.com/questions/25126295/swift-class-does-not-implement-its-superclasss-required-members
}
