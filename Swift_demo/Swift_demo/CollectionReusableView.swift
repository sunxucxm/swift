//
//  CollectionReusableView.swift
//  Swift_demo
//
//  Created by sunxu on 2019/4/30.
//  Copyright © 2019 sunxu. All rights reserved.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {
    
    
    var titleLabel:UILabel?//title
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    func initView(){
        titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 30))
        titleLabel?.backgroundColor = UIColor.yellow
        self .addSubview(titleLabel!)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
