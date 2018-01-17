//
//  DrewImageView.swift
//  Quartz2D-Demo
//
//  Created by Vampire_时代 on 2018/1/15.
//  Copyright © 2018年 Vampire. All rights reserved.
//

import UIKit
// View 之所以能显示,是因为内部的Layer ,Layer通过渲染内容来使View 中的内容呈现
class DrewImageView: UIView{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        print(#function)
        if let image = UIImage.init(named: "11"){
            //way 1
            image.draw(at: CGPoint.zero) //保持原来图片
            
//            //way 2
//            UIRectClip(CGRect(x: 0, y: 0, width: 50, height: 50)) // 添加裁剪区域
//            image.drawAsPattern(in: self.bounds)
        }
        
    }
    
    
}

