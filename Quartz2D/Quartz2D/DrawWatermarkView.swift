//
//  DrawWatermarkView.swift
//  Quartz2D-Demo
//
//  Created by Vampire_时代 on 2018/1/15.
//  Copyright © 2018年 Vampire. All rights reserved.
//

import UIKit
// View 之所以能显示,是因为内部的Layer ,Layer通过渲染内容来使View 中的内容呈现
class DrawWatermarkView: UIView{
    
    public var image: UIImage?{
        didSet{
            self.setNeedsDisplay() // 重绘视图
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if let tempImage = UIImage.init(named: "11"){
            self.image = watermark(image: tempImage)
            self.image = clipCrile(image: self.image)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        print(#function)
        if let ima = image {
            ima.draw(in: rect)
        }
    }
    
    
    // 生成一个新的加水印图片
    func watermark(image: UIImage?) -> UIImage?{
        if let tempImage = image{
            //<#T##size: CGSize##CGSize#> 大小
            //<#T##opaque: Bool##Bool#> 不透明度
            //<#T##scale: CGFloat##CGFloat#> 是否缩放 0.0 代表不缩放
            UIGraphicsBeginImageContextWithOptions(tempImage.size, false, 0.0)
            tempImage.draw(at: CGPoint.zero)
            let str:NSString = "@我是水印儿"
            let rect = CGRect.init(x:120, y: 120, width: 200, height: 30)
            str.draw(in: rect, withAttributes:
                [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20),
                 NSAttributedStringKey.backgroundColor: UIColor.red, // 背景色
                 NSAttributedStringKey.foregroundColor: UIColor.white]// 字体颜色
                     )
            
            // 获取 到图片
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            // 关闭
            UIGraphicsEndImageContext()
            return newImage
        }
        return nil
    }
    
    
    // 裁圆
    func clipCrile(image: UIImage?) -> UIImage? {
        if let tempImage = image{
            UIGraphicsBeginImageContextWithOptions(tempImage.size, false, 0.0)
            let path = UIBezierPath(ovalIn: CGRect(origin: CGPoint.init(x: 0, y: 0), size: tempImage.size))
            path.addClip()
            tempImage.draw(at: CGPoint.zero)
            // 获取 到图片
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            // 关闭
            UIGraphicsEndImageContext()
            return newImage
        }
        return nil
    }
    
    
}

