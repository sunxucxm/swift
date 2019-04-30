
//
//  TextVeiwVC.swift
//  Swift_demo
//
//  Created by 孙旭 on 2019/4/29.
//  Copyright © 2019 sunxu. All rights reserved.
//

import UIKit

class TextVeiwVC: UIViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let textView = UITextView(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        textView.backgroundColor = UIColor.blue
        textView.textColor = UIColor.white
        textView.delegate = self
        self.view.addSubview(textView)
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print("jjjjjjjjjjj")
    }
    
}
