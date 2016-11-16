//
//  ProgressView.swift
//  Quartz2D
//
//  Created by weirenxin on 2016/11/15.
//  Copyright © 2016年 广西家饰宝科技有限公司. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    var progress: Double? {
        didSet {
            
            self.draw(self.bounds)
            self.setNeedsDisplay()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    override func draw(_ rect: CGRect) {
        guard let progress = progress else { return }
        
        let center = CGPoint(x: rect.size.width * 5, y: rect.size.height * 0.5)
        let radius = rect.size.width * 0.5 - 10
        let startA: Double = -M_PI_2
        let endA: Double = -M_PI_2 + progress * M_PI * 2
        
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(startA), endAngle: CGFloat(endA), clockwise:  true)
        UIColor.red.setStroke()
        path.lineWidth = 2.0
        path.stroke()
    }
}
