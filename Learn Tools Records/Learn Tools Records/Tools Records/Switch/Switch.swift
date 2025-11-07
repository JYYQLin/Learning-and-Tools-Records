//
//  Switch.swift
//  Learn Tools Records
//
//  Created by JYYQLin on 2025/11/8.
//

import Foundation

class SwitchDome {
    
    enum tempEnum {
        case a, b, c, d, e
    }
    
    func tempFunc1() {
        
        let i1 = tempEnum.a
        
        /**
         如果用@unknown default， 就必须把所有可能取值都进行处理
         推荐使用，如果后期枚举增加新值，这里就会报错，提示你对新值的判断
         */
        switch i1 {
        case .a:
            break
        case .b:
            break
        case .c:
            break
        case .d:
            break
        case .e:
            break
            
        @unknown default:
            break
        }
        
        /**
         如果用 default， 就defaut就是没写的其他可能取值都在 default 处理
         */
        switch i1 {
        case .a:
            break
        default:
            break
        }
        
        /**
         fallthrough: 就是执行复合条件的那个之外，还额外强制复合下一个 case 的条件
            假设这里复合了.b，就会打印 b, 但是由于 b 里有 fallthrough，那么也会打印 c。 如果 c 里也有，那么则会打印下一个 case
         */
        
        
        let i2 = tempEnum.b
        
        switch i2 {
        case .a:
            print("a")
        case .b:
            print("b")
            fallthrough
        case .c:
            print("c")
        case .d:
            print("d")
        case .e:
            print("e")
        @unknown default:
            break
        }
    }
    
}
