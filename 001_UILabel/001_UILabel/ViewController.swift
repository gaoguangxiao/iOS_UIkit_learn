//
//  ViewController.swift
//  001_UILabel
//
//  Created by 高广校 on 2024/3/26.
//

import UIKit
import ZKBaseSwiftProject

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSizeMake(360 * ZKAdapt.rate, 50 * ZKAdapt.rate))
        }
        

        if #available(iOS 15.0, *) {
            let text = "登录即代表您已同意"
            setiOS15PrivicyContent(text)
        } else {
            let text = "登录即代表您已同意《用户协议》、《隐私政策》\n及《儿童个人信息保护规则及监护人须知》"
            // Fallback on earlier versions
            setPrivicyContent(text)
        }
    }
    
    //设置隐私协议view内容
    func setPrivicyContent(_ info: String) {
        
        let attrStr = NSMutableAttributedString(string: info)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 4
        attrStr.addAttributes([.paragraphStyle:style,
                               .font:UIFont.regular(14 * ZKAdapt.rate),
                               .foregroundColor:UIColor.zk85848B
        ], range: info.range)
        let userRange = info.range(of: "《用户协议》")
        attrStr.addAttribute(.link, value: "uesrProtorl://", range: userRange)
        let privacyRange = info.range(of: "、《隐私政策》")
        attrStr.addAttribute(.link, value: "privacy://", range: privacyRange)
        let childRange = info.range(of: "《儿童个人信息保护规则及监护人须知》")
        attrStr.addAttribute(.link, value: "childInfo://", range: childRange)
        label.attributedText = attrStr
        //
    }
    
    //    @available(iOS15.0,*)
    @available(iOS 15.0,*)
    func setiOS15PrivicyContent(_ info: String) {
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 4
        
        let attributeContainer = AttributeContainer([.foregroundColor:UIColor.zk85848B,
                                                     .font:UIFont.regular(14 * ZKAdapt.rate),
                                                     .paragraphStyle:style])
       
        var iOS15Att = AttributedString(info,attributes:attributeContainer)
        
        let linkContainer = AttributeContainer([.foregroundColor:UIColor.black,
                                                .font:UIFont.regular(14 * ZKAdapt.rate),
                                                .paragraphStyle:style])
        
        iOS15Att.append(AttributedString("《用户协议》",attributes:linkContainer))
        iOS15Att.append(AttributedString("、《隐私政策》\n",attributes:linkContainer))
        iOS15Att.append(AttributedString("和《儿童个人信息保护规则及监护人须知》",attributes:linkContainer))
        label.attributedText = NSAttributedString(iOS15Att)
    }
    
    lazy var label: UILabel = {
        let l = UILabel()
        //        l.textAlignment = .center
        if #available(iOS 13.0, *) {
            l.backgroundColor = .systemGray2
        } else {
            // Fallback on earlier versions
            l.backgroundColor = .systemGray
        }
//        l.textColor = .zk85848B
        l.numberOfLines = 0
        return l
    }()
    
}

@available(iOS 17.0,*)
#Preview("Lebel", traits: .defaultLayout, body: {
    ViewController()
})
