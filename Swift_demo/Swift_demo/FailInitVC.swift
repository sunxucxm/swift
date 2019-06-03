
//
//  FailInitVC.swift
//  Swift_demo
//
//  Created by sunxu on 2019/4/30.
//  Copyright © 2019 sunxu. All rights reserved.
//

import UIKit

class FailInitVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "可失败构造器"
    }
}

//可失败构造器要求 可失败构造器会创建一个类型为自身类型的可选类型的对象。你通过 return nil 语句来表明可失败构造器在何种情况下应该 “失败”。严格来说，构造器都不支持返回值。因为构造器本身的作用，只是为了确保对象能被正确构造。因此你只是用 return nil 表明可失败构造器构造失败，而不要用关键字 return 来表明构造成功。
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}


//枚举类型的可失败构造器
//你可以通过一个带一个或多个参数的可失败构造器来获取枚举类型中特定的枚举成员。如果提供的参数无法匹配任何枚举成员，则构造失败。
//下例中，定义了一个名为 TemperatureUnit 的枚举类型。其中包含了三个可能的枚举成员（Kelvin、Celsius 和 Fahrenheit），以及一个根据 Character 值找出所对应的枚举成员的可失败构造器：
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}

//必要构造器
//在类的构造器前添加 required 修饰符表明所有该类的子类都必须实现该构造器：
//在子类重写父类的必要构造器时，必须在子类的构造器前也添加 required 修饰符，表明该构造器要求也应用于继承链后面的子类。在重写父类中必要的指定构造器时，不需要添加 override 修饰符：

class SomeClass {
    required init() {
        // 构造器的实现代码
    }
}

class SomeSubclass: SomeClass {
    required init() {
        // 构造器的实现代码
    }
}
