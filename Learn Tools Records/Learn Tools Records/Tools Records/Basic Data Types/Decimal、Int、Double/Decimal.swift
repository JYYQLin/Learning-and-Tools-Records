//
//  Decimal.swift
//  Learn Tools Records
//
//  Created by JYYQLin on 2025/11/7.
//

import Foundation

/**
 在 Swift 中，Decimal（全称为 Foundation.Decimal）是一种高精度十进制浮点数类型，专为需要精确表示十进制小数的场景设计（如金融、货币、税务等对精度敏感的计算）。它与 Float、Double 等二进制浮点数不同，能够避免二进制浮点运算中常见的精度误差问题
 
 推荐使用字符串构建，防止浮点数本身精度问题，导致构建的数出现问题，比如 let a = Decimal(3.24) 打印 a 的值就有错误
 */

class DecimalDome {
    
    static func printMaxDecimal() {
        //  打印Decimal最大值
        print(Decimal.greatestFiniteMagnitude)
    }
    
    static func printDecimalMagnitude() {
        //  转化绝对值
        let a: Decimal = Decimal(string: "-3.24")!
        print(a.magnitude)
    }

}
