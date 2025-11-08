//
//  ViewController.swift
//  Learn Tools Records
//
//  Created by JYYQLin on 2025/11/7.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.yellow
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let model1 = HashModel()
        model1.modelID = "dsfdf"
        model1.modelName = "name1"
        
        
        let model2 = HashModel()
        model2.modelID = "dsfdf"
        model2.modelName = "name2"
        
        if model1 > model2 {
            print("他们想等")
        }
        else{
            print("不等于")
        }
    }
}

