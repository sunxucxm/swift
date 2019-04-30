//
//  DelegateVC.swift
//  Swift_demo
//
//  Created by 孙旭 on 2019/4/29.
//  Copyright © 2019 sunxu. All rights reserved.
//

import UIKit

class DelegateVC: UIViewController,SomeProtocol {

    
    
    
    //在协议中定义类方法的时候，总是使用 static 关键字作为前缀。当类类型遵循协议时，除了 static 关键字，还可以使用 class 关键字作为前缀
    class func someTypeMethod() {
        
    }
    
    /*static 能修饰class/struct/enum的计算属性、存储属性、类型方法;class能修饰类的计算属性和类方法 static修饰的类方法不能继承；class修饰的类方法可以继承 在protocol中要使用static*/
    class var ff:Int {
        return 10
    }
    
    static var someTypeProperty: Int = 0
    
    var mustBeSettable: Int = 0
    
    var doesNotNeedToBeSettable: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        var lightSwitch = OnOffSwitch.off
        lightSwitch.toggle()
    }
    

   

}

protocol SomeProtocol {
    static var someTypeProperty: Int { get set }
    var mustBeSettable: Int { get set }
    
//    如果协议要求属性是可读可写的，那么该属性不能是常量属性或只读的计算型属性。如果协议只要求属性是可读的，那么该属性不仅可以是可读的，如果代码需要的话，还可以是可写的。
    var doesNotNeedToBeSettable: Int { get }
    
    static func someTypeMethod()
}



//将 mutating 关键字作为方法的前缀，写在 func 关键字之前，表示可以在该方法中修改它所属的实例以及实例的任意属性的值
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

//构造器要求
//协议可以要求遵循协议的类型实现指定的构造器。你可以像编写普通构造器那样，在协议的定义里写下构造器的声明，但不需要写花括号和构造器的实体
//你可以在遵循协议的类中实现构造器，无论是作为指定构造器，还是作为便利构造器。无论哪种情况，你都必须为构造器实现标上 required 修饰符：
//使用 required 修饰符可以确保所有子类也必须提供此构造器实现，从而也能符合协议。
//如果类已经被标记为 final，那么不需要在协议构造器的实现中使用 required 修饰符，因为 final 类不能有子类。关于 final 修饰符的更多内容，请参见防止重写。

protocol aProtocol {
    init(someParameter: Int)
}

class aClass: aProtocol {
    required init(someParameter: Int) {
        // 这里是构造器的实现部分
    }
}

//如果一个子类重写了父类的指定构造器，并且该构造器满足了某个协议的要求，那么该构造器的实现需要同时标注 required 和 override 修饰符：
protocol bProtocol {
    init()
}

class bSuperClass {
    init() {
        // 这里是构造器的实现部分
    }
}

class bSubClass: bSuperClass, bProtocol {
    // 因为遵循协议，需要加上 required
    // 因为继承自父类，需要加上 override
    required override init() {
        // 这里是构造器的实现部分
    }
}

//有条件地遵循协议
//泛型类型可能只在某些情况下满足一个协议的要求，比如当类型的泛型形式参数遵循对应协议时。你可以通过在扩展类型时列出限制让泛型类型有条件地遵循某协议。在你采纳协议的名字后面写泛型 where 分句。更多关于泛型 where 分句，见泛型 Where 分句。
//下面的扩展让 Array 类型只要在存储遵循 TextRepresentable 协议的元素时就遵循 TextRepresentable 协议。

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}
//let myDice = [d6, d12]
//print(myDice.textualDescription)
// 打印 "[A 6-sided dice, A 12-sided dice]"

//在扩展里声明采纳协议
//当一个类型已经符合了某个协议中的所有要求，却还没有声明采纳该协议时，可以通过空扩展体的扩展采纳该协议：

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

//从现在起，Hamster 的实例可以作为 TextRepresentable 类型使用：

//let simonTheHamster = Hamster(name: "Simon")
//let somethingTextRepresentable: TextRepresentable = simonTheHamster
//print(somethingTextRepresentable.textualDescription)
// 打印 “A hamster named Simon”


//协议的继承
//协议能够继承一个或多个其他协议，可以在继承的协议的基础上增加新的要求。协议的继承语法与类的继承相似，多个被继承的协议间用逗号分隔：
//例子中定义了一个新的协议 PrettyTextRepresentable，它继承自 TextRepresentable 协议。任何遵循 PrettyTextRepresentable 协议的类型在满足该协议的要求时，也必须满足 TextRepresentable 协议的要求。

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

//extension SnakesAndLadders: TextRepresentable {
//    var textualDescription: String {
//        return "A game of Snakes and Ladders with \(finalSquare) squares"
//    }
//}

//extension SnakesAndLadders: PrettyTextRepresentable {
//    var prettyTextualDescription: String {
//        var output = textualDescription + ":\n"
//        for index in 1...finalSquare {
//            switch board[index] {
//            case let ladder where ladder > 0:
//                output += "▲ "
//            case let snake where snake < 0:
//                output += "▼ "
//            default:
//                output += "○ "
//            }
//        }
//        return output
//    }
//}



//类专属的协议
//你通过添加 AnyObject 关键字到协议的继承列表，就可以限制协议只能被类类型采纳（以及非结构体或者非枚举的类型）。
//在以上例子中，协议 SomeClassOnlyProtocol 只能被类类型采纳。如果尝试让结构体或枚举类型采纳 SomeClassOnlyProtocol，则会导致编译时错误。
//protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
//    // 这里是类专属协议的定义部分
//}




//可选的协议要求
//
//协议可以定义可选要求，遵循协议的类型可以选择是否实现这些要求。在协议中使用 optional 关键字作为前缀来定义可选要求。可选要求用在你需要和 Objective-C 打交道的代码中。协议和可选要求都必须带上 @objc 属性。标记 @objc 特性的协议只能被继承自 Objective-C 类的类或者 @objc 类遵循，其他类以及结构体和枚举均不能遵循这种协议。
//
//使用可选要求时（例如，可选的方法或者属性），它们的类型会自动变成可选的。比如，一个类型为 (Int) -> String 的方法会变成 ((Int) -> String)?。需要注意的是整个函数类型是可选的，而不是函数的返回值。
//
//协议中的可选要求可通过可选链式调用来使用，因为遵循协议的类型可能没有实现这些可选要求。类似 someOptionalMethod?(someArgument) 这样，你可以在可选方法名称后加上 ? 来调用可选方法。详细内容可在可选链式调用章节中查看。
//
//下面的例子定义了一个名为 Counter 的用于整数计数的类，它使用外部的数据源来提供每次的增量。数据源由 CounterDataSource 协议定义，包含两个可选要求：

@objc protocol CounterDataSource {
    @objc optional func incrementForCount(count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

//CounterDataSource 协议定义了一个可选方法 increment(forCount:) 和一个可选属性 fiexdIncrement，它们使用了不同的方法来从数据源中获取适当的增量值。

//严格来讲，CounterDataSource 协议中的方法和属性都是可选的，因此遵循协议的类可以不实现这些要求，尽管技术上允许这样做，不过最好不要这样写。

//Counter 类含有 CounterDataSource? 类型的可选属性 dataSource，如下所示：

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.incrementForCount?(count: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}







































