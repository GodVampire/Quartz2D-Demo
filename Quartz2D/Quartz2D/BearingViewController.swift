//
//  BearingViewController.swift
//  Quartz2D-Demo
//
//  Created by Vampire_时代 on 2018/1/15.
//  Copyright © 2018年 Vampire. All rights reserved.
//

import UIKit

class BearingViewController: UIViewController {

    var viewName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        if let name = viewName{
            if let tempView = VCSTRING_TO_VIEWCONTROLLER(name){
                tempView.frame = CGRect.init(x: 100, y: 100, width: 200, height: 200)
                self.view.addSubview(tempView)
            }
        }

    }
    
    /// 类文件字符串转换为ViewController
    ///
    /// - Parameter childControllerName: VC的字符串
    /// - Returns: ViewController
    func VCSTRING_TO_VIEWCONTROLLER(_ childControllerName: String) -> UIView?{
        
        // 1.获取命名空间
        // 通过字典的键来取值,如果键名不存在,那么取出来的值有可能就为没值.所以通过字典取出的值的类型为AnyObject?
        guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            print("命名空间不存在")
            return nil
        }
        // 2.通过命名空间和类名转换成类
        guard let cls = NSClassFromString(clsName as! String + "." + childControllerName) else {
            print("没有获取到对应的class")
            return nil
        }

        // swift 中通过Class创建一个对象,必须告诉系统Class的类型
        guard let clsType = cls as? UIView.Type else {
            print("无法转换成UIViewController")
            return nil
        }
        // 3.通过Class创建对象
        let childController = clsType.init()
        
        return childController
    }
    
}
