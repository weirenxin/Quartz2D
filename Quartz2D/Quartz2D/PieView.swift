//
//  PieView.swift
//  Quartz2D
//
//  Created by weirenxin on 2016/11/16.
//  Copyright © 2016年 广西家饰宝科技有限公司. All rights reserved.
//

import UIKit

class PieView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    override func draw(_ rect: CGRect) {
        
        let dataArr = [25.0, 25.0, 25.0, 25.0]
        
        let center = CGPoint(x: rect.size.width * 0.5, y: rect.size.height * 0.5)
        let radius = rect.size.width * 0.5 - 10
        var startA: Double = 0
        var angle:Double = 0
        var endA: Double = 0
        
        for number in dataArr {
            
            startA = endA
            angle = number / 100.0 * M_PI * 2
            endA = startA + angle
            
            let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(startA), endAngle: CGFloat(endA), clockwise: true)
            path.addLine(to: center)
            randomColor().set()
            path.fill()
        }
    }
 
    
    
    private func drawPie() {
        
        let center = CGPoint(x: bounds.size.width * 0.5, y: bounds.size.height * 0.5)
        let radius = bounds.size.width * 0.5 - 10
        var startA: Double = 0
        var angle = 25 / 100.0 * M_PI * 2
        var endA = startA + angle
        
        var path = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(startA), endAngle: CGFloat(endA), clockwise: true)
        path.addLine(to: center)
        UIColor.red.set()
        path.fill()
        
        startA = endA
        angle = 25/100.0 * M_PI * 2
        endA = startA + angle
        
        path = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(startA), endAngle: CGFloat(endA), clockwise: true)
        path.addLine(to: center)
        UIColor.purple.set()
        path.fill()
        
        startA = endA
        angle = 50/100.0 * M_PI * 2
        path = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(startA), endAngle: CGFloat(endA), clockwise: true)
        path.addLine(to: center)
        UIColor.black.set()
        path.fill()
    }
    
    private func randomColor() -> (UIColor) {
        let r = Double(arc4random_uniform(256)) / 255.0
        let g = Double(arc4random_uniform(256)) / 255.0
        let b = Double(arc4random_uniform(256)) / 255.0
        
        return UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1)
    }
}


