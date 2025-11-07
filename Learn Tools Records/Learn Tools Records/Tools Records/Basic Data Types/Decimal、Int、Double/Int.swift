//
//  Int.swift
//  Learn Tools Records
//
//  Created by JYYQLin on 2025/11/7.
//

/**
 Int:
 
 属性区：
 名称    类型（静态 / 实例）    说明    示例
 min    静态    Int 能表示的最小值（64 位系统中为 -9223372036854775808）    print(Int.min) → 输出最小值
 max    静态    Int 能表示的最大值（64 位系统中为 9223372036854775807）    print(Int.max) → 输出最大值
 zero    静态    表示 0（所有数值类型通用的 “零值”）    let z = Int.zero → z 为 0
 one    静态    表示 1（所有数值类型通用的 “一值”）    let o = Int.one → o 为 1
 bitWidth    静态    Int 的位数（64 位系统中为 64，32 位为 32）    print(Int.bitWidth) → 输出 64（现代设备）
 magnitude    实例    返回当前值的绝对值，类型为 Int.Magnitude（即 UInt）    let num = -5; print(num.magnitude) → 输出 5（类型为 UInt）
 sign    实例    返回值的符号，类型为 Sign（.positive 或 .negative）    let num = -3; print(num.sign) → 输出 .negative
 trailingZeros    实例    二进制表示中末尾连续 0 的个数    let num = 8; print(num.trailingZeros) → 8 是1000，输出 3
 leadingZeros    实例    二进制表示中开头连续 0 的个数（补全到 bitWidth 位后）    let num = 3; print(num.leadingZeros) → 3 是0...011，输出 62（64 位）
 words    实例    以无符号整数数组形式返回 Int 的原始字节（遵循 FixedWidthInteger）    let num = 0x1234; print(num.words) → 输出 [4660]（取决于位数）
 isZero    实例    判断值是否为 0（等价于 self == 0）    let num = 0; print(num.isZero) → 输出 true
 
 
 常用方法区：
 名称    类型（静态 / 实例）    说明
 addingReportingOverflow(_:)    实例    加法运算并返回是否溢出（返回 (partialValue: Int, overflow: Bool)）    Int.max.addingReportingOverflow(1) → (partialValue: -9223372036854775808, overflow: true)
 subtractingReportingOverflow(_:)    实例    减法运算并返回是否溢出    Int.min.subtractingReportingOverflow(1) → 溢出返回 true
 multipliedReportingOverflow(by:)    实例    乘法运算并返回是否溢出    Int.max.multipliedReportingOverflow(by: 2) → 溢出返回 true
 dividedReportingOverflow(by:)    实例    除法运算并返回是否溢出（含除数为 0 的判断）    5.dividedReportingOverflow(by: 0) → overflow: true
 
 
 位运算
 & (lhs: Int, rhs: Int)    静态（运算符）    按位与（对应位都为 1 则为 1）    3 & 5 → 1（011 & 101 = 001）
 `    (lhs: Int, rhs: Int)`    静态（运算符）    按位或（对应位有 1 则为 1）    `3    5→7（011    101 = 111`）
 ^ (lhs: Int, rhs: Int)    静态（运算符）    按位异或（对应位不同则为 1）    3 ^ 5 → 6（011 ^ 101 = 110）
 ~ (x: Int)    静态（运算符）    按位取反（0 变 1，1 变 0）    ~3 → -4（64 位下 ~000...011 = 111...100，补码表示为 -4）
 << (lhs: Int, rhs: Int)    静态（运算符）    左移运算（左移 rhs 位，右侧补 0）    3 << 2 → 12（011 << 2 = 1100）
 >> (lhs: Int, rhs: Int)    静态（运算符）    右移运算（有符号右移，左侧补符号位）    -4 >> 1 → -2（111...1100 >> 1 = 111...1110）
 
 */

import Foundation

class IntDome {
    
    static func printMaxInt() {
        //  打印Int最大值
        print(Int.max)
    }
    
    static func printMinInt() {
        //   打印Int最小值
        print(Int.min)
    }
    
    static func printIntMagnitude() {
        //  转化绝对值
        let a = -199
        print(a.magnitude)
    }
    
    /**
     打印传入数字的符号：
     返回值枚举
        传入 -1 打印 minus
        传入 1 打印 plus
     */
    static func printIntSign(_ i: Double) {
        
        print((-1).sign)
        print(1.sign)
    }
    
    /**
     对比A、B之间的距离:
        A - B 然后取绝对值，就是A = 5 B = 8或者A = 8 B = 5都返回3
     */
    static func printDistance(A: Int, B: Int) {
        
        let result = A.distance(to: B)
        print(result)
    }
    
    /**
     其实就是A + B:
     */
    static func printAdvanced(A: Int, B: Int) {
        let result = A.advanced(by: B)
        print(result)
    }
    
    /**
     A 是否是 B 的倍数:
     */
    static func printIsMultiple(A: Int, B: Int) {
        
        let result = A.isMultiple(of: B)
        print(result)
    }
}

//  MARK: 数学运算
extension IntDome {
    /**
     打印在最大值再加传入的参数:
        加法运算并返回是否溢出（返回 (partialValue: Int, overflow: Bool)）
     */
    static func printAddingReportingOverflow(_ i: Int) {
        
        let result = Int.max.addingReportingOverflow(i)
        print(result)
    }
    
    /**
     打印在最小值再减去传入的参数:
        减法运算并返回是否溢出（返回 (partialValue: Int, overflow: Bool)）
     */
    static func printSubtractingReportingOverflow(_ i: Int) {
        
        let result = Int.min.subtractingReportingOverflow(i)
        print(result)
    }
    
    /**
     打印在最大值再乘去传入的参数:
        乘法运算并返回是否溢出（返回 (partialValue: Int, overflow: Bool)）
     */
    static func printMultipliedReportingOverflow(_ i: Int) {
        
        let result = Int.max.multipliedReportingOverflow(by: i)
        print(result)
    }
    
    /**
     打印在最大值再除去传入的参数:
        除法运算并返回是否溢出（含除数为 0 的判断）（返回 (partialValue: Int, overflow: Bool)）
     */
    static func printDividedReportingOverflow(_ i: Int) {
        
        let result = Int.min.dividedReportingOverflow(by: i)
        print(result)
    }
}

//  MARK: 位运算
extension IntDome {
    /**
     打印2左运算移动一位的结果
        操作规则：将整数的二进制位整体向左移动指定位数，右侧空缺的位置补 0。
        数值变化：左移 n 位 ≈ 原数 × 2ⁿ（无溢出时完全等价）。
     */
    static func printShiftLeft() {
        print(2<<1)
    }
    
    /**
     打印2右运算移动一位的结果
         操作规则：将整数的二进制位整体向右移动指定位数，左侧空缺的位置补 “符号位”（正数补 0，负数补 1，因为 Swift 中整数是 “有符号补码” 存储）。
         数值变化：右移 n 位 ≈ 原数 ÷ 2ⁿ（无余数时完全等价，负数向下取整）。
     */
    static func printShiftRight() {
        print(2>>1)
    }
}
