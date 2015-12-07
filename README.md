# Swfit-CustomAlertView
iOS-Swift-自定义alerView
# 前言
---
昨天有位网友和我说想要AlertView的Swift版(OC版请见我另一篇博客),于是今天这边博客就诞生啦!
如果有其他网友有需求的都可以和我说,我会在空余时间把博客写出来的.


# 效果图:

![CustomAlertView](http://upload-images.jianshu.io/upload_images/1298596-a8f6870bc5914614.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---
#上代码

##首先创建一个CustomAlertView的类,该类继承自NSobject


![CustomAlertView.swift](http://upload-images.jianshu.io/upload_images/1298596-c2e569c3271c62a8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##然后在CustomAlertView.swift中写入以下代码

```
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
```
##在ViewController.swift中调用
```
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
```
##来张效果图

![SwiftCustomAlertView](http://upload-images.jianshu.io/upload_images/1298596-d27a46168e06d858.gif?imageMogr2/auto-orient/strip)

##GitHub:https://github.com/Lafree317/Swfit-CustomAlertView



---
本人还是一只小菜鸡,不过是一只热心肠的菜鸡,如果有需要帮助或者代码中有更好的建议的话可以发邮件到lafree317@163.com中,我们一起进步XD
