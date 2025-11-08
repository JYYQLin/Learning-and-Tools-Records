//
//  Hash.swift
//  Learn Tools Records
//
//  Created by JYang on 2025/11/8.
//

import Foundation

class HashModel: Comparable {
    
    lazy var modelID: String = ""
    lazy var modelName: String = ""
    
    static func < (lhs: HashModel, rhs: HashModel) -> Bool {
        return false
    }
    
    static func == (lhs: HashModel, rhs: HashModel) -> Bool {
        return lhs.modelID == rhs.modelID
    }
    
    //    func hash(into hasher: inout Hasher) {
    //        hasher.combine(modelID)
    //    }
    
}

class HashModel1: Equatable {
    static func == (lhs: HashModel1, rhs: HashModel1) -> Bool {
        return lhs.modelID == rhs.modelID
    }
    
    
    lazy var modelID: String = ""
    lazy var modelName: String = ""
    
    
    
}

class HashModel3: Hashable {
    
    lazy var modelID: String = ""
    lazy var modelName: String = ""
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(modelID)
    }
    
    static func == (lhs: HashModel3, rhs: HashModel3) -> Bool {
        return lhs.modelID == rhs.modelID
    }
}
