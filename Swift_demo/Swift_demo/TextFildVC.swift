//
//  TextFildVC.swift
//  Swift_demo
//
//  Created by 孙旭 on 2019/4/28.
//  Copyright © 2019 sunxu. All rights reserved.
//

import UIKit

class TextFildVC: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let tf = UITextField(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        tf.placeholder = "请输入名字"
        tf.delegate = self
        tf.backgroundColor = UIColor.blue
        tf.text = "d"
        tf.addTarget(self, action: #selector(changeText(tf:)), for: UIControl.Event.editingChanged)
        let placeholserAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white,NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)]
        tf.attributedPlaceholder = NSAttributedString(string: "QQ号/手机号/邮箱",attributes: placeholserAttributes)
        
       
        self.view.addSubview(tf)
        
        
        
        
        

    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    @objc func changeText(tf:UITextField){
        if let text = tf.text {
            if text.count>3 {
                let index3 = text.index(text.startIndex, offsetBy: 3)
                tf.text = String(text[text.startIndex..<index3])
            }
        }
        
    }
   

}

/*截取某字符串的前10个字符串

let sub1 = str.prefix(10)

截取某字符串的后10个字符串

let str1 = str.suffix(10)

也可以换种写法

let index2 = str.index(str.endIndex, offsetBy: -10)
let sub4 = str[index2..<str.endIndex]

截取某字符串的第3个字符到第6个字符范围的字符串

let index3 = str.index(str.startIndex, offsetBy: 3)
let index4 = str.index(str.startIndex, offsetBy: 6)
let sub4 = str[index3..<index4]*/


