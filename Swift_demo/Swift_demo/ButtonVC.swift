//
//  ButtonVC.swift
//  Swift_demo
//
//  Created by 孙旭 on 2019/4/20.
//  Copyright © 2019 sunxu. All rights reserved.
//

import UIKit

@objcMembers
class ButtonVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 10;
        button.layer.masksToBounds = true
//        button.setBackgroundImage(UIImage(named: "icon_empty@2x"), for: UIControl.State.normal)
        button.setImage(UIImage(named: "icon_empty@2x"), for: UIControl.State.normal)
        button.adjustsImageWhenHighlighted=false //使触摸模式下按钮也不会变暗
        button.adjustsImageWhenDisabled=false //使禁用模式下按钮也不会变暗
        button.setTitle("普通状态", for:UIControl.State.normal) //普通状态下的文字
        button.setTitle("触摸状态", for:UIControl.State.highlighted) //触摸状态下的文字
        button.setTitle("禁用状态", for:UIControl.State.disabled) //禁用状态下的文字
        button.addTarget(self, action: #selector(click(clickType:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        /*TouchDown：单点触摸按下事件，点触屏幕
        TouchDownRepeat：多点触摸按下事件，点触计数大于1，按下第2、3或第4根手指的时候
        TouchDragInside：触摸在控件内拖动时
        TouchDragOutside：触摸在控件外拖动时
        TouchDragEnter：触摸从控件之外拖动到内部时
        TouchDragExit：触摸从控件内部拖动到外部时
        TouchUpInside：在控件之内触摸并抬起事件
        TouchUpOutside：在控件之外触摸抬起事件
        TouchCancel：触摸取消事件，即一次触摸因为放上太多手指而被取消，或者电话打断*/
        
    }
    

     func click(clickType type:Int) -> Int {
        return 10
    }
    

}

/*
 As of Swift 4 you’ll start seeing the error “Argument of ‘#selector’ refers to instance method ‘firstPage()’ that is not exposed to Objective-C”, along with the proposed fix of “Add ‘@objc’ to expose this instance method to Objective-C”. What this means is that the Swift method in question isn’t visible to Objective-C, which matters because UIBarButtonItem is Objective-C code.
 
 While adding @objc to individual methods is a working solution, I expect most people will just shrug their shoulders and put @objcMembers before their class – that automatically exposes everything in the class to Objective-C, just like Swift 3 used to. So, modify the class definition to this:
 
 从Swift 4开始，你会看到错误“参数' #selector '指的是实例方法' firstPage() '不暴露给Objective-C”，以及建议修复“添加' @objc '来暴露这个实例方法给Objective-C”。这意味着Swift方法对Objective-C是不可见的，这很重要，因为UIBarButtonItem是Objective-C代码。
 
 虽然在单个方法中添加@objc是一个有效的解决方案，但我希望大多数人只是耸耸肩，将@objcMembers放在类之前——这将自动地将类中的所有内容暴露给Objective-C，就像Swift 3过去所做的那样。因此，将类定义修改为:
 
 
 
 
 Swift 4 changed the way Swift interacts with Objective-C in a way that will impact the code of most developers. Fortunately, there are a couple of fixes available, neither of which take too long to implement.
 
 First, let’s take a look at what’s changed and why. In Swift 3 all methods from a class were automatically compiled so that they were available both to Swift code and to Objective-C code, which maximized compatibility.
 
 However, that had a cost. Here’s what Doug Gregor wrote when proposing the change for Swift 4:
 
 There is a cost for each Objective-C entry point, because the Swift compiler must create a "thunk" method that maps from the Objective-C calling convention to the Swift calling convention and is recorded within Objective-C metadata. This increases the size of the binary (preliminary tests on some Cocoa[Touch] apps found that 6-8% of binary size was in these thunks alone, some of which are undoubtedly unused), and can have some impact on load time (the dynamic linker has to sort through the Objective-C metadata for these thunks).
 
 So, all these thunk methods had to be generated whether or not they were used, which wasn’t ideal. As of Swift 4, this has been dramatically scaled down so that these thunks are generated only when absolutely required, which means any time you write Swift code that needs to be called from Objective-C you will need to tell Swift what to do.
 
 Swift 4改变了Swift与Objective-C交互的方式，这将影响大多数开发人员的代码。幸运的是，有两个可用的修复程序，它们都不需要太长时间来实现。
 
 首先，让我们看看发生了什么变化，以及原因。在Swift 3中，类中的所有方法都是自动编译的，因此它们对Swift代码和Objective-C代码都是可用的，这最大化了兼容性。
 
 然而，这是有代价的。以下是道格·格里格在为斯威夫特4提议改变时所写的:
 
 每个Objective-C入口点都有成本，因为Swift编译器必须创建一个“thunk”方法，该方法将从Objective-C调用约定映射到Swift调用约定，并记录在Objective-C元数据中。这增加的大小二进制(初步测试一些可可(触摸)应用程序发现6 - 8%的二进制大小仅在这些铛,其中一些无疑是未使用的),并能有一些影响加载时间(动态链接器整理这些铛的objective - c的元数据)。
 
 因此，所有这些thunk方法都必须生成，不管它们是否被使用，这并不理想。从Swift 4开始，这一功能已经被大幅缩减，因此只有在绝对必要的时候才会产生这些“雷鸣”，这意味着无论何时你编写Swift代码，需要从Objective-C调用时，你都需要告诉Swift该怎么做。
 */
