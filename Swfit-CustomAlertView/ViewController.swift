//
//  ViewController.swift
//  Swfit-CustomAlertView
//
//  Created by huchunyuan on 15/12/6.
//  Copyright © 2015年 huchunyuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CustomAlertViewDelegate{
    // 只有把类定义定义在全局才可以把点击方法封装到类中
    let alertView = CustomAlertView()
    // 提示view
    var customAlertView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 搭建提示view
        layoutAlertView()
    }
    // 搭建提示view
    func layoutAlertView(){
        // 定义代理
        alertView.delegate = self;
        // 传值
        customAlertView = alertView.layoutAlertView(["测试1","测试2","测试3","确定","取消"])
        // 定义位置
        customAlertView.center = self.view.center
        // 切圆
        // Bool.init(1) 代表yes
        customAlertView.layer.masksToBounds = Bool.init(1)
        customAlertView.layer.cornerRadius = 10;
        // 隐藏
        customAlertView.alpha = 0.0
        customAlertView.hidden = true
        // 添加到控制器view上
        self.view.addSubview(customAlertView)
    }
    // 提示出现
    @IBAction func alertAction(sender: UIButton) {
        // UIView动画 出现
        UIView.animateWithDuration(0.1) { () -> Void in
            self.customAlertView.alpha = 1.0
            self.customAlertView.hidden = false
        }
    }
    // 代理方法
    func didClicPassIdentifire(identifire: String) {
        print(identifire)
        // UIView动画 隐藏
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.customAlertView.alpha = 0.0
            }) { (Bool) -> Void in
            self.customAlertView.hidden = true
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

