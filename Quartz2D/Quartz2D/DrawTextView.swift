//
//  DrawTextView.swift
//  Quartz2D-Demo
//
//  Created by Vampire_时代 on 2018/1/15.
//  Copyright © 2018年 Vampire. All rights reserved.
//

import UIKit
// View 之所以能显示,是因为内部的Layer ,Layer通过渲染内容来使View 中的内容呈现
class DrawTextView: UIView{
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        print(#function)
        
        let str:NSString = "Vampire_时代"
        
        var dict = [NSAttributedStringKey : Any]()
        dict[NSAttributedStringKey.font] = UIFont.systemFont(ofSize: 20)
        dict[NSAttributedStringKey.backgroundColor] = UIColor.white // 背景色
        
        dict[NSAttributedStringKey.foregroundColor] = UIColor.red // 字体色
        dict[NSAttributedStringKey.strokeWidth] = 3//描边宽度
        
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 1, height: 1) //阴影偏移量
        shadow.shadowColor = UIColor.yellow
        shadow.shadowBlurRadius = 1 // 模糊程度
        dict[NSAttributedStringKey.shadow] = shadow
        
        // 需要是 NSString
        str.draw(in: CGRect(x:20, y: 80, width: 200, height: 30), withAttributes: dict)
    }
    
    
}

