//
//  DrawHeartView.swift
//  Quartz2D-Demo
//
//  Created by Vampire_时代 on 2018/1/15.
//  Copyright © 2018年 Vampire. All rights reserved.
//
import UIKit
// View 之所以能显示,是因为内部的Layer ,Layer通过渲染内容来使View 中的内容呈现
class DrawHeartView: UIView{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        print(#function)
        // 1.取得genView相关连的上下文
        if  let ctx = UIGraphicsGetCurrentContext(){
            // 2.描述路径
            let path = UIBezierPath()
            // 2.1 设置起点
            path.move(to: CGPoint(x: 20, y: 80))
            // 2.2 移动到某一个点
            path.addLine(to: CGPoint(x: 100, y: 180))
            // 一个路径可以画多条线,以上条线为起点
            path.addLine(to: CGPoint(x: 180, y: 80))
            // 添加贝塞尔曲线 to:终点   controlPoint控制点  offsetx来控制弯曲的位置   offsetY来控制区线的弯曲程度
            path.addQuadCurve(to: CGPoint(x: 100, y: 070), controlPoint: CGPoint(x: 140, y: -10))
            path.addQuadCurve(to: CGPoint(x: 20, y: 80), controlPoint: CGPoint(x: 60, y: -10))
            
            // 设置上下文状态  都以 set 开头
            ctx.setLineWidth(10) // 线宽
            ctx.setLineJoin(.round) // 连接样式
            ctx.setLineCap(.butt) // 顶角样式
            ctx.setStrokeColor(UIColor.red.cgColor) // 线的颜色
            
            // 需要 在添加到上下文之前 配置
            //                ctx.translateBy(x: <#T##CGFloat#>, y: <#T##CGFloat#>)// 平移
            //                ctx.rotate(by: <#T##CGFloat#>)// 旋转
            //                ctx.scaleBy(x: <#T##CGFloat#>, y: <#T##CGFloat#>) // 缩放
            
            ctx.saveGState() // 保存住上下文中的状态   --- 即:把状态固定住，即使改变了，不影响下次的值（默认是共用一个全局变量）
            ctx.restoreGState() // 恢复
            
            // 3. 把路径添加到上下文
            ctx.addPath(path.cgPath)
            // 4. 把上下文渲染出来
            ctx.strokePath()
            
            
        }
        
    }
    
    
}
