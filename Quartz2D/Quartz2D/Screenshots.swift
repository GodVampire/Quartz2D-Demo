//
//  Screenshots.swift
//  Quartz2D-Demo
//
//  Created by Vampire_时代 on 2018/1/15.
//  Copyright © 2018年 Vampire. All rights reserved.
//

import UIKit
// View 之所以能显示,是因为内部的Layer ,Layer通过渲染内容来使View 中的内容呈现
class Screenshots: UIView{
    
    private var image: UIImage?{
        didSet{
            self.setNeedsDisplay() // 重绘视图
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.gray
        
  

        NotificationCenter.default.addObserver(self, selector: #selector(screenshots), name: NSNotification.Name.UIApplicationUserDidTakeScreenshot, object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit{
       NotificationCenter.default.removeObserver(self)
    }
    
    override func draw(_ rect: CGRect) {
        print(#function)
        let str:NSString = "请手动截屏"
        str.draw(in: CGRect(x:20, y: 80, width: 100, height: 30), withAttributes: nil)
        
        if let ima = image {
            ima.draw(in: rect)
        }
    }
    
    @objc func screenshots() {
        if let image = self.imageWithScreenshot() {
            self.image = image
        }
    }
    
    func imageWithScreenshot() -> UIImage? {
        
        // 截取 范围大小
        UIGraphicsBeginImageContextWithOptions((self.window?.bounds.size)!, false, 0.0)
        
        if let ctx = UIGraphicsGetCurrentContext(){
            
            for window in UIApplication.shared.windows {
                if window.responds(to: #selector(UIView.drawHierarchy)){
                    
                    window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
                    
                }else{
                    window.layer.render(in: ctx)
                }
            }
            //            ctx.translateBy(x: 30, y: 30)// 平移
            //            ctx.scaleBy(x: 300, y: 600) // 缩放
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            // 把新图片写入到桌面
            //            let data = UIImageJPEGRepresentation(newImage!, 1) // 压缩值
            let data = UIImagePNGRepresentation(newImage!)
            
            let image = UIImage.init(data: data!)
            return image
            
        }
        return nil
    }
    
    override func didMoveToSuperview() {
      
    }

    override func willMove(toSuperview newSuperview: UIView?) {
       
    }
}

