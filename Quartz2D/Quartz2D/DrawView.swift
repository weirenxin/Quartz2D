//
//  DrawView.swift
//  Quartz2D
//
//  Created by weirenxin on 2016/11/12.
//  Copyright © 2016年 广西家饰宝科技有限公司. All rights reserved.
//

import UIKit
import QuartzCore

class DrawView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    /**
     * 绘图
     * viewDidLoad -> viewWillAppear -> drawRect -> viewDidAppear
     * rect: 当前view 的 bounds
     */
    override func draw(_ rect: CGRect) {
        /// 在draw 方法中已经创建一个跟view 相关联的上下文[Layer上下文]
        
        //drawLine()
        
        //drawCurve()
        
        //drawRectangle()
        
        //drawCircular()
        
        drawRadian(rect: rect)
    }
}

extension DrawView {
    
    fileprivate func drawRadian(rect: CGRect) {
        
        /**
         * arcCenter: 弧度所在圆心
         * radius:    圆的半径
         * startAngle:开始的角度
         * endAngle:  截止的角度
         * clockwise: ture 为顺时针  false 为逆时针
         */
        let center = CGPoint(x: rect.size.width * 0.5, y: rect.size.height * 0.5)
        let radius = rect.size.width * 0.5 - 10
        
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: -(CGFloat)(M_PI_2), endAngle: 3 * (CGFloat(M_PI_2)), clockwise: true)
        UIColor.purple.setFill()
        path.fill()
    }
    
    
    /// 画圆
    fileprivate func drawCircular() {
        
        let path = UIBezierPath(ovalIn: CGRect(x: 50, y: 50, width: 100, height: 50))
        
        //UIColor.red.set()
        UIColor.red.setFill()
        
        path.lineWidth = 5
        
        /// 使用 UIBezierPath 绘图方法进行绘制
        //path.stroke()
        path.fill()
        
        /// stroke() : 1.获取上下文 2.描述路径 3.把路径添加到上下文 4.将上下文渲染到view上
        /// 只有在drawRect方法中获取到上下文
        
    }
    
    /// 画矩形
    fileprivate func drawRectangle() {
        
        let ctx = UIGraphicsGetCurrentContext()
        //let path = UIBezierPath(rect: CGRect(x: 50, y: 50, width: 200, height: 100))
        let path = UIBezierPath(roundedRect: CGRect(x: 50, y: 50, width: 200, height: 100), cornerRadius: 30)  // 圆角矩形
        
        ctx?.addPath(path.cgPath)
        //ctx?.strokePath()
        ctx?.fillPath()    // 填充
    }
}

extension DrawView {
    
    /// 画曲线
    fileprivate func drawCurve() {
        
        let ctx = UIGraphicsGetCurrentContext()
        let path = UIBezierPath()
        
        /// controlPoint: 控制点[控制曲线的弯曲程度]
        path.move(to: CGPoint(x: 50, y: 280))
        path.addQuadCurve(to: CGPoint(x: 250, y: 280), controlPoint: CGPoint(x: 50, y: 50))
        
        ctx?.addPath(path.cgPath)
        ctx?.strokePath()
    }
    
    
    /// 画直线
    fileprivate func drawLine() {
        
        // 1.获取上下文
        let ctx = UIGraphicsGetCurrentContext()
        
        // 2.绘制路径
        let path = UIBezierPath()
        
        // 起点\终点
        path.move(to: CGPoint(x: 50, y: 280))
        path.addLine(to: CGPoint(x: 280, y: 50))
        
        // 终点\起点
        path.addLine(to: CGPoint(x: 280, y: 280))
        
        // 上下文状态
        ctx?.setLineWidth(5)
        ctx?.setLineJoin(.round)
        ctx?.setStrokeColor(UIColor.red.cgColor)
        
        // 3.将绘制内容保存到上下文
        ctx?.addPath(path.cgPath)
        
        // 4.将上下文内容显示到view上[渲染到view 的layer]
        ctx?.strokePath()
    }
}
