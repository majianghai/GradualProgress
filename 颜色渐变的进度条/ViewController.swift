//
//  ViewController.swift
//  颜色渐变的进度条
//
//  Created by majianghai on 2018/7/18.
//  Copyright © 2018年 majianghai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var view2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        testFunc1()
        
        testFunc2()
    }
    
    func testFunc1() {
        
        let colors = [UIColor.yellow.cgColor, UIColor.orange.cgColor, UIColor.red.cgColor]
        
        let gradientView = GradientView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 30, height: 15), colors: colors, locations: [0.0, 0.4, 1.0])
        
        gradientView.setProgress(progress: 0.6)
        
        view1.addSubview(gradientView)
    }
    
    func testFunc2() {
        
        let colors = [UIColor.yellow.cgColor, UIColor.orange.cgColor, UIColor.red.cgColor]

        let gradientView = GradientView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 30, height: 15), colors: colors, locations: [0.0, 0.4, 1.0])
        
        gradientView.setProgress(progress: 1, isAni: false)
        
        view2.addSubview(gradientView)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

