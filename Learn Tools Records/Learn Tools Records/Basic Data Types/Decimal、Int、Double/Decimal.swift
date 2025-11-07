//
//  Decimal.swift
//  Learn Tools Records
//
//  Created by JYYQLin on 2025/11/7.
//

import Foundation

/**
 在 Swift 中，Decimal（全称为 Foundation.Decimal）是一种高精度十进制浮点数类型，专为需要精确表示十进制小数的场景设计（如金融、货币、税务等对精度敏感的计算）。它与 Float、Double 等二进制浮点数不同，能够避免二进制浮点运算中常见的精度误差问题
 */

class DecimalDome {
    
    static func printMaxDecimal() {
        //  打印Decimal最大值
        print(Decimal.greatestFiniteMagnitude)
    }
    static func printDecimalMagnitude() {
        //  转化绝对值
        let a: Decimal = 199
        print(a.magnitude)
    }
}
