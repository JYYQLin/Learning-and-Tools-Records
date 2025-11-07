//
//  Array.swift
//  Learn Tools Records
//
//  Created by JYYQLin on 2025/11/8.
//

import Foundation

class ArrayDome {
    
    /** 排序 */
    func sorted() {
        
        var number1 = [22, 12, 45, 7 ,8, 6, 11,33]
        // 直接排序原数组
        number1.sort()
        
        let number2 = [22, 12, 45, 7 ,8, 6, 11,33]
        // 排序返回一个新数组
        var number3 = number2.sorted()
        
        //  默认是从小到大排序，但是可以通过参数改变排序条件。如下 改为从大到小
        number3.sort(by: >)
    }
    
    /** 打乱数组 */
    func shuffle() {
     
        var number1 = [22, 12, 45, 7 ,8, 6, 11,33]
        // 直接打乱原数组
        number1.shuffle()
        
        let number2 = [22, 12, 45, 7 ,8, 6, 11,33]
        // 打乱数组返回一个新数组
        let number3 = number2.shuffled()
    }
}
