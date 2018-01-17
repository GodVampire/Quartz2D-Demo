//
//  DrawingBoardView.swift
//  Quartz2D-Demo
//
//  Created by Vampire_时代 on 2018/1/15.
//  Copyright © 2018年 Vampire. All rights reserved.
//

import UIKit

// Tip: 注意一下 范围
// 按钮功能自行实现

class DrawingBoardView: UIView{
    
    let bgColor = UIColor.white
    
    var path = DrawingBoradBezierPath()
    var paths = [DrawingBoradBezierPath]()
    var tempPaths = [DrawingBoradBezierPath]()
    
    var lineWith: CGFloat = 1.0
    var lineColor: UIColor = UIColor.black
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = bgColor
        setUpPan()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpPan(){
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(pan(_:)))
        self.addGestureRecognizer(pan)
    }
    
    @objc func pan(_ pan:UIPanGestureRecognizer){
        let cur = pan.location(in: self)
        
        if pan.state == .began{
            path.move(to: cur)
            path.lineWidth = lineWith
            path.color = lineColor // 保存线的颜色
            paths.append(path)
            tempPaths.append(path)
        }else if pan.state == .changed{
            path.addLine(to: cur)
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        for p in paths {
            p.color.set()
            p.stroke()
        }
    }
    
}

// MARK: 线相关
extension DrawingBoardView {
    
    /// 清屏
    public func clear(){
        paths.removeAll()
        setNeedsDisplay()
    }
    
    /// 撤销
    public func undo(){
        paths.removeLast()
        setNeedsDisplay()
    }
    
    /// 恢复撤销
    public func recover(){
        
    }
    
    /// 擦除
    public func erase(){
        // 跟背景色相同遮盖
        lineColor = bgColor
    }
    
    ///  设置线宽
    ///
    /// - Parameter with: 宽度
    public func line(with: CGFloat){
        lineWith = with
    }
    
    ///  设置线的颜色
    ///
    /// - Parameter color: 颜色
    public func line(color: UIColor){
        lineColor = color
    }
    
}


extension DrawingBoardView {
    
    public func save() -> UIImage?{
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        
        defer { UIGraphicsEndImageContext() }
        
        if let ctx = UIGraphicsGetCurrentContext() {
            
            self.layer.render(in: ctx)
            
            if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
                //                UIImageWriteToSavedPhotosAlbum(newImage, self, #selector(), nil)
                return newImage
            }
        }
        return nil
    }
    
}


// MARK: 用于保存 path 的属性
class DrawingBoradBezierPath: UIBezierPath {
    var color: UIColor = UIColor.black
    
    
}


