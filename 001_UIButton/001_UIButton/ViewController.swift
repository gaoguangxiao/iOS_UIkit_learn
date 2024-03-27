//
//  ViewController.swift
//  001_UIButton
//
//  Created by 高广校 on 2024/3/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(loginBtn)
        loginBtn.frame = CGRect(x: 10, y: 100, width: 100, height: 40)
        
        var btnconfig = UIButton.Configuration.plain()
        btnconfig.cornerStyle = .dynamic
        btnconfig.attributedTitle = AttributedString("登录 dynamic", attributes: AttributeContainer([.font:UIFont.TextStyle.callout]))
//        var back = UIBackgroundConfiguration.clear()
//        back.image = UIImage(named: "ui-btn-2")
//        btnconfig.background = back
        let btn = UIButton(configuration: btnconfig)
//        btn.setImage(UIImage(named: "ui-btn-2"), for: .normal)
        self.view.addSubview(btn)
        btn.frame = CGRect(x: 10, y: 150, width: 100, height: 40)
        
        if #available(iOS 17.0, *) {
            btn.isSymbolAnimationEnabled = true
        } else {
            // Fallback on earlier versions
        }
//        btn.imageView?.addSymbolEffect(.variableColor.iterative)
        btn.imageView?.setSymbolImage(UIImage(named: "ui-btn-2") ?? UIImage(), contentTransition: .replace.offUp)
    }

    
    lazy var loginBtn: UIButton = {
        
        var btn : UIButton = UIButton(type: .custom)
        
        if #available(iOS 15.0, *) {
            var btnconfig = UIButton.Configuration.plain()
            btnconfig.cornerStyle = .large //圆角样式
//            btnconfig.title = "登录"
            // 设置按钮标题、字体
            btnconfig.attributedTitle = AttributedString("登录", attributes: AttributeContainer([.font:UIFont.TextStyle.callout]))
            // 设置 字体颜色
//            btnconfig.baseForegroundColor = .white
            var back = UIBackgroundConfiguration.clear()
            back.image = UIImage(named: "ui-btn-2")
            btnconfig.background = back

            btn = UIButton(configuration: btnconfig)
        } else {
            // Fallback on earlier versions
        }
        return btn
    }()

}

//#Preview("Vc", traits: Preview.ViewTraits, body: {
//    
//})

#Preview("VC", body: {
    return ViewController()
})
