//
//  TableViewTableViewCell.swift
//  Swift_demo
//
//  Created by 孙旭 on 2019/5/7.
//  Copyright © 2019 sunxu. All rights reserved.
//

import UIKit

class TableViewTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = UIColor.yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        print("")
    }
}
