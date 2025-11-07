//
//  Range.swift
//  Learn Tools Records
//
//  Created by JYang on 2025/11/7.
//

import Foundation

/**
  Range:
    1...3、1..<3、...4、4...等，就是表示一个范围，a...b，a不能大于 b
    如果是 1..<3, "a"..<"c", 那么数据类型就是 Range<类型>，前面的分别是 Range<Int>、Range<String>
    
    如果是1...3，那么数据类型就是 closedRange<Int>
 
    其他还有开放区间：
 ClosedRange：闭区间（lowerBound ≤ element ≤ upperBound），格式为 a...b（如 1...5 包含 1 到 5）。
 PartialRangeFrom：左闭右无限区间（lowerBound ≤ element），格式为 a...（如 3... 表示 ≥3 的所有值）。
 PartialRangeThrough：左无限右闭区间（element ≤ upperBound），格式为 ...b（如 ...5 表示 ≤5 的所有值）。
 PartialRangeUpTo：左无限右开区间（element < upperBound），格式为 ..<b（如 ..<5 表示 <5 的所有值）。
 
 
 常用属性：
     特有属性：
     lowerBound ： 区间的下界（包含），如 1..<5 的 lowerBound 是 1。    Range 特有
     upperBound ： 区间的上界（不包含），如 1..<5 的 upperBound 是 5。    Range 特有
 
     继承属性（Collection）
     startIndex ：区间的起始索引（等于 lowerBound，因为 Range 的索引即元素本身）。    Collection 继承
     endIndex  ： 区间的结束索引（等于 upperBound，不包含）。    Collection 继承
     isEmpty ：判断区间是否为空（lowerBound >= upperBound 时为 true）。    Collection 继承
     count ：区间内元素的数量（仅适用于 整数类型，非整数类型会崩溃）。    Collection 继承；如 1..<5 的 count 是 4
     first ： 区间的第一个元素（非空时为 lowerBound）。    Collection 继承
     last  ：区间的最后一个元素（仅适用于整数类型，非空时为 upperBound - 1）。    Collection 继承；如 1..<5 的 last 是 4
     indices ：区间的所有索引（即区间本身，因为 Range 的索引与元素一一对应）。    Collection 继承；类型为 Range<Bound>
     elementType  ：区间元素的类型（如 1..<5 的 elementType 是 Int.self）。    Collection 继承
     subSequence ：子序列的类型（通常是 Range<Bound>）。    Collection 继承
     underestimatedCount ： 元素数量的低估值（等于 count，仅用于性能优化）。    Collection 继承
 
 
 常用方法：
    特有方法：
         contains(_ element: Bound) -> Bool    判断元素是否在区间内（lowerBound ≤ element < upperBound）。    (1..<5).contains(3) → true；(1..<5).contains(5) → false
 
         overlaps(_ other: Range<Bound>) -> Bool    判断两个区间是否重叠（有共同元素）。    (1..<5).overlaps(3..<7) → true；(1..<3).overlaps(4..<6) → false
 
         clamped(to limits: Range<Bound>) -> Range<Bound>    将区间「夹紧」到 limits 范围内，返回新区间（确保结果在 limits 内）。    (1..<5).clamped(to: 3..<7) → 3..<5；(0..<2).clamped(to: 3..<7) → 3..<3（空）
 
         intersection(_ other: Range<Bound>) -> Range<Bound>?    返回两个区间的交集（无交集则返回 nil）。    (1..<5).intersection(3..<7) → 3..<5；(1..<3).intersection(4..<6) → nil
         union(_ other: Range<Bound>) -> Range<Bound>    返回两个区间的并集（仅支持相邻或重叠的区间，否则触发运行时错误）。    (1..<3).union(3..<5) → 1..<5；(1..<3).union(5..<7) → 崩溃（不相邻）
 
         relative(to collection: some Collection<Bound>) -> Range<Bound>    返回相对于 collection 的区间（通常用于索引区间转换，如数组索引）。    let arr = [10,20,30,40]; (1..<3).relative(to: arr) → 1..<3（数组索引区间）
 
         mutating func formIntersection(_ other: Range<Bound>)    原地修改当前区间为与 other 的交集（无交集则变为空区间）。    var range = 1..<5; range.formIntersection(3..<7) → range 变为 3..<5
 
         mutating func formUnion(_ other: Range<Bound>)    原地修改当前区间为与 other 的并集（仅支持相邻 / 重叠区间）。    var range = 1..<3; range.formUnion(3..<5) → range 变为 1..<5
 
    Range 作为 Collection，支持所有集合操作（如遍历、映射、过滤等），但需注意：仅整数类型的 Range 可遍历（非整数类型无限，无法遍历）：
 
        randomElement() -> Bound? 区间中的一个随机元素（类型为 Bound?），若区间为空则返回 nil 区间元素数量必须是有限的。 1..<4 或者 1...4 都可以，但是 1...或 0.1..<0.2 就不可以
 
        prefix(_ maxLength: Int) -> SubSequence    返回前 maxLength 个元素的子区间。    (1..<5).prefix(2) → 1..<3
        
        suffix(_ maxLength: Int) -> SubSequence    返回后 maxLength 个元素的子区间。    (1..<5).suffix(2) → 3..<5
        
        dropFirst(_ k: Int = 1) -> SubSequence    去掉前 k 个元素，返回剩余子区间。    (1..<5).dropFirst(1) → 2..<5
 
        dropLast(_ k: Int = 1) -> SubSequence    去掉后 k 个元素，返回剩余子区间。    (1..<5).dropLast(1) → 1..<4
 
        forEach(_ body: (Bound) throws -> Void)    遍历区间内每个元素，执行闭包。    (1..<5).forEach { print($0) } → 打印 1、2、3、4
 
        map<T>(_ transform: (Bound) throws -> T) rethrows -> [T]    映射每个元素为 T 类型，返回数组。    (1..<5).map { $0 * 2 } → [2,4,6,8]
     
        filter(_ isIncluded: (Bound) throws -> Bool) rethrows -> [Bound]    过滤符合条件的元素，返回数组。    (1..<5).filter { $0 % 2 == 0 } → [2,4]
 
        reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Bound) throws -> Result) rethrows -> Result    归约计算（如求和、求积）。    (1..<5).reduce(0, +) → 10（1+2+3+4）
 
        contains(where predicate: (Bound) throws -> Bool) rethrows -> Bool    判断是否存在符合条件的元素。    (1..<5).contains { $0 == 3 } → true
 
    first(where predicate: (Bound) throws -> Bool) rethrows -> Bound?    找到第一个符合条件的元素。    (1..<5).first { $0 % 2 == 0 } → 2
 
 */
