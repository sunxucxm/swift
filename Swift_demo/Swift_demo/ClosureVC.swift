
//
//  ClosureVC.swift
//  Swift_demo
//
//  Created by 孙旭 on 2019/5/8.
//  Copyright © 2019 sunxu. All rights reserved.
//

import UIKit

class ClosureVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
//        通过内联闭包表达式构造的闭包作为参数传递给函数或方法时，总是能够推断出闭包的参数和返回值类型。这意味着闭包作为函数或者方法的参数时，你几乎不需要利用完整格式构造内联闭包。
        slosure(a: 1, b: 2, closure: {(a: Int,b: Int) -> Int in
        
           return a + b
        })
        
        
        slosure(a: 1, b: 2){(a: Int,b: Int) -> Int in
            
            return a + b
        }
        
        slosure(a: 1, b: 2, closure: {(a,b) -> Int in
            
            return a + b
        })
        
        slosure(a: 1, b: 2, closure: {(a,b) in
            
            return a + b
        })
        
        slosure(a: 1, b: 2, closure: {a,b in
            
            return a + b
        })
        
        //单行表达式闭包可以通过省略 return 关键字来隐式返回单行表达式的结果，
        slosure(a: 1, b: 2, closure: {a,b in  a + b })
        
        //Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推。
        //如果你在闭包表达式中使用参数名称缩写，你可以在闭包定义中省略参数列表，并且对应参数名称缩写的类型会通过函数类型进行推断。in 关键字也同样可以被省略
        slosure(a: 1, b: 2, closure: { $0 + $1 })
        
        // 以下是不使用尾随闭包进行函数调用
        someFunctionThatTakesAClosure(closure: {
            // 闭包主体部分
        })
        
        // 以下是使用尾随闭包进行函数调用
        someFunctionThatTakesAClosure() {
            // 闭包主体部分
        }
        
        someFunctionThatTakesAClosure {
            
        }
    }
    
    func someFunctionThatTakesAClosure(closure: () -> Void) {
        // 函数体部分
    }
    
    func slosure(a: Int, b: Int, closure: (_ a: Int, _ b: Int) -> Int) {
        // 函数体部分
        print(closure(a,b))
    }
  

}
