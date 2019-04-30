//
//  ViewVC.swift
//  Swift_demo
//
//  Created by 孙旭 on 2019/4/20.
//  Copyright © 2019 sunxu. All rights reserved.
//
//1F2029
import UIKit

 class ViewVC: UIViewController {

   private var name: String = "sunxu"
    
    public func abc() {
        print("abc")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.backgroundColor = UIColor.yellow
        view.layer.cornerRadius = 10;
        view.clipsToBounds = true
        self.view.addSubview(view)
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(click))
        self.view.addGestureRecognizer(tap)
        
    }
    
    
    @objc func click() {
        print("点击")
    }

}

class jjjj: ViewVC {
  
    override func abc() {
        //        name = ""
        
    }
}

//open > public > interal > fileprivate > private
/*private 访问级别所修饰的属性或者方法只能在当前类里访问，继承都不行
fileprivate 访问级别所修饰的属性或者方法在当前的 Swift 源文件里可以访问。

internal（默认访问级别，internal修饰符可写可不写）

internal 访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问。
如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。
如果是 App 代码，也是在整个 App 代码，也是在整个 App 内部可以访问。一个App就是一个模块，一个第三方API, 第三等方框架等都是一个完整的模块)


public 可以被任何人访问。但其他 模块 中不可以被 override 和继承，而在 模块 内可以被 override 和继承
 
open 可以被任何人使用，包括 override 和继承。
*/
