//
//  CustomAlertView.swift
//  Swfit-CustomAlertView
//
//  Created by huchunyuan on 15/12/6.
//  Copyright © 2015年 huchunyuan. All rights reserved.
//


import UIKit
// 定义代理
protocol CustomAlertViewDelegate {
    //代理方法
    func didClicPassIdentifire(identifire:String)
}
class CustomAlertView: NSObject {
    // 代理属性
    var delegate : CustomAlertViewDelegate?
     func layoutAlertView(dataArr:Array<String>)->UIView{
        let buttonH = CGFloat(61)
        let buttonW = CGFloat(250);
        // 通过数组长度创建view
        let alertView = UIView(frame:CGRectMake(0, 0, buttonW,CGFloat(CGFloat(dataArr.count)*buttonH)))
        for  i:Int in 0..<dataArr.count {
            // 创建容器view
            let view = UIView(frame: CGRectMake(0, CGFloat(i)*buttonH, buttonW, buttonH))
            view.backgroundColor = UIColor.whiteColor()
            // 创建button
            let button = UIButton(type: UIButtonType.System)
            button.frame = CGRectMake(0, 0, buttonW, buttonH)
            button.addTarget(self, action:Selector("buttonClickABC:"), forControlEvents: UIControlEvents.TouchUpInside)
            button.setTitle(dataArr[i], forState: UIControlState.Normal)
            view.addSubview(button)
            // 判断是否有取消
            if dataArr[i] == "取消"{
                button.tintColor = UIColor.whiteColor()
                view.backgroundColor = UIColor.blueColor()
            }else{
                // 不是取消绘制分割线
                button.tintColor = UIColor.lightGrayColor()
                let lineView = UIView(frame: CGRectMake(0, 60, buttonW, 1))
                lineView.backgroundColor = UIColor.lightGrayColor()
                view.addSubview(lineView)
            }
            alertView.addSubview(view)
        }
        return alertView
    }
    // 提示点击
    func buttonClickABC(button:UIButton) {
        // 提示代理执行方法
        self.delegate?.didClicPassIdentifire(button.titleLabel!.text!)
    }
}
