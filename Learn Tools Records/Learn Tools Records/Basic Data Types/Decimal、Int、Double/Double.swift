//
//  Double.swift
//  Learn Tools Records
//
//  Created by JYYQLin on 2025/11/7.
//

import Foundation

/**
 1、Float的长度(大小)不如Double， Float（32 位浮点数）和 Double（64 位浮点数）
 
 
 */
class DoubleDome {
    
    static func printMaxDouble() {
        //  打印Double最大值
        print(Double.greatestFiniteMagnitude)
        print(Float.greatestFiniteMagnitude)
    }
    
    static func printMinDouble() {
        //  打印Double最小值
        print(Double.leastNormalMagnitude)
        print(Float.leastNormalMagnitude)
        
        //  打印Double非0的最小值
        print(Double.leastNonzeroMagnitude)
        print(Float.leastNonzeroMagnitude)
        
//        print(Double.leastNormalMagnitude)      // 输出：2.2250738585072014e-308（最小正常数）
//        print(Double.leastNonzeroMagnitude)     // 输出：4.9406564584124654e-324（最小非零值，非正规数）
//
//        // 对比大小：最小非零值 < 最小正常数
//        print(Double.leastNonzeroMagnitude < Double.leastNormalMagnitude) // true
    }
    
    static func printDoubleMagnitude() {
        //  转化绝对值
        let a: Double = -199.22
        print(a.magnitude)
    }
    
    static func printDoublePi() {
        print(Double.pi)
        print(Float.pi)
    }
    
    /**
     打印传入数字的符号：
     返回值枚举
        传入 -1 打印 minus
        传入 1 打印 plus
     */
    static func printDoubleSign(_ i: Double) {
        
        print((-1).sign)
        print(1.sign)
    }
    
    /**
     打印传入数字判断是否为无穷大（+inf 或 -inf）
     */
    static func printDoubleIsInfinite(_ i: Double) {
        
        print(i.isInfinite)
    }
    
    /**
     打印传入数字判断是否为非数值（NaN，如 0.0 / 0.0）
     */
    static func printDoubleIsNaN(_ i: Double) {
        
        print(i.isNaN)
    }
    
    /**
     打印传入数字判断是否为有限值（非无穷大且非 NaN）
     */
    static func printDoubleIsFinite(_ i: Double) {
        
        print(i.isFinite)
    }
    
    /**
     打印传入数字:
     nextUp   比当前值大的最小可表示值
     nextDown 比当前值小的最大可表示值
     */
    static func printDoubleNext(_ i: Double) {
        
        print(i.nextUp)
        print(i.nextDown)
    }
    
    
    /**
     对比A、B之间的距离:
        A - B 然后取绝对值，就是A = 5 B = 8或者A = 8 B = 5都返回3
     */
    static func printDistance(A: Double, B: Double) {
        
        let result = A.distance(to: B)
        print(result)
    }
    
    /**
     其实就是A + B:
     */
    static func printAdvanced(A: Double, B: Double) {
        let result = A.advanced(by: B)
        print(result)
    }
}

//  MARK: 数学运算
extension DoubleDome {
    /**
     打印在最大值再加传入的参数:
        a.addingProduct(b, c) 等价于 a + (b * c)，即：）
     */
    static func printAddingReportingOverflow(_ i: Double) {
        
        let result = Double.greatestFiniteMagnitude.addingProduct(2, 3)
        print(result)
    }
    
    /**
     打印:
        用于计算当前数值的平方根
     a.squareRoot() 返回其平方根 b，满足 b × b = a
     */
    static func printSquareRoot(_ i: Double) {
        
        let result = i.squareRoot()
        print(result)
    }
    
    /**
     打印传入值四舍五入
     */
    static func printRounded(_ i: Double) {
        
        //  MARK: rounded不修改原变量， 返回一个新值
        //  不修改原变量，返回新值， 返回默认规则（四舍五入）的舍入结果
        let result = i.rounded()
        
        /**
         根据规则四舍五入
         规则如下：
         .toNearestOrAwayFromZero    四舍五入（默认规则）：小数 ≥0.5 远离零舍入，否则靠近零舍入    3.5→4.0；3.2→3.0；-3.5→-4.0
         .toNearestOrEven    四舍六入五成双（银行家舍入）：小数 0.5 时舍入到最近的偶数    3.5→4.0（3 是奇数，舍入到 4）；2.5→2.0（2 是偶数）；-3.5→-4.0
         .up    向上舍入（远离零）：无论小数部分是多少，都向绝对值更大的方向舍入    3.2→4.0；-3.2→-4.0；3.9→4.0
         .down    向下舍入（靠近零）：无论小数部分是多少，都向绝对值更小的方向舍入    3.9→3.0；-3.9→-3.0；3.1→3.0
         .towardZero    截断（向零舍入）：直接忽略小数部分，保留整数部分    3.9→3.0；-3.9→-3.0；3.1→3.0
         */
        let result1 = i.rounded(.towardZero)
        
        print(result)
    }
    
}
