//
//  GradientView.swift
//  MaZhan_Swift
//
//  Created by majianghai on 2018/7/16.
//  Copyright © 2018年 maZhan. All rights reserved.
//

import UIKit

class GradientView: UIView, CAAnimationDelegate {
    
    var gradientLayer: CAGradientLayer!
    var maskLayer: CALayer!
    
    
    init(frame:CGRect, colors: [CGColor], locations: [NSNumber])  {
        super.init(frame: frame)
        
        setupGradientLayer(colors: colors, locations: locations)
        
        setupMaskLayer()
    }
    
    /// 初始化 gradientLayer
    private func setupGradientLayer(colors: [CGColor], locations: [NSNumber]) {
        
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = bounds
        
        // 设置渐变颜色数组
        gradientLayer.colors = colors
        
        // 设置渲染的起始结束位置（横向渐变）
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        // 定义每种颜色所在的位置
        gradientLayer.locations = locations
        
        layer.addSublayer(gradientLayer)
    }
    
    private func setupMaskLayer() {
        
        maskLayer = CALayer()
        
        maskLayer.frame = bounds
        
        maskLayer.backgroundColor = UIColor.white.cgColor
        
         layer.mask = maskLayer
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    open func setProgress(progress: CGFloat, isAni: Bool = true) {
        
        var progress = progress
        if progress > 1 {progress = 1}
        
        maskLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width * progress, height: self.frame.size.height)
        
        if isAni {
            
            // 设置 boundsAnimation
            let boundsAnimation = CABasicAnimation()
            boundsAnimation.keyPath = "bounds"
            boundsAnimation.duration = 1.5
            
            // 长度从0开始
            boundsAnimation.fromValue = CGRect(x: 0, y: 0, width: 0, height: self.frame.size.height)
            
            // 根据modelLayer和presentationLayer的关系，我们不设置toValue则系统会自动把modelLayer的值作为toValue
            
            maskLayer.add(boundsAnimation, forKey: nil)
            
            
            // 设置 boundsAnimation
            let positionAnimation = CABasicAnimation()
            positionAnimation.keyPath = "position"
            positionAnimation.duration = 1.5
            
            positionAnimation.fromValue = CGPoint(x: 0, y: self.frame.size.height/2)
            
            maskLayer.add(positionAnimation, forKey: nil)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func gradient() {
        //定义渐变的颜色（从黄色渐变到橙色）
        let topColor = UIColor(red: 0xfe/255, green: 0xd3/255, blue: 0x2f/255, alpha: 1)
        let secondColor = UIColor(red: 0xfc/255, green: 0x68/255, blue: 0x20/255, alpha: 1)
        let buttomColor = UIColor.lightGray
        let gradientColors = [topColor.cgColor, secondColor.cgColor ,buttomColor.cgColor]
        
        
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 0.4, 0.7, 1.0]
        
        let gradientBackLayer = CAGradientLayer()
        
        //创建CAGradientLayer对象并设置参数
        gradientBackLayer.colors = gradientColors
        gradientBackLayer.locations = gradientLocations
        
        //设置渲染的起始结束位置（横向渐变）
        gradientBackLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientBackLayer.endPoint = CGPoint(x: 1, y: 0)
        
        //设置其CAGradientLayer对象的frame，并插入view的layer
        gradientBackLayer.frame = bounds
        
        self.layer.insertSublayer(gradientBackLayer, at: 0)
    }
    
   
    
}





