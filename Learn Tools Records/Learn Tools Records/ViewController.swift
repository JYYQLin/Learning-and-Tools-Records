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
        DoubleDome.printMaxDouble()
        DoubleDome.printMinDouble()
        DoubleDome.printDoubleMagnitude()
        DoubleDome.printDoublePi()
        
//        DoubleDome.printAddingReportingOverflow(0)
//        DoubleDome.printSubtractingReportingOverflow(1)
//        DoubleDome.printMultipliedReportingOverflow(2)
//        
//        
//        IntDome.printDividedReportingOverflow(20)
//        IntDome.printDividedReportingOverflow(0)
//        
//        print(2<<1)
//        print((-1).sign)
//        print(1.sign)
    }
}

