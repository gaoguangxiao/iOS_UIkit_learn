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
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(CGSizeMake(360 * ZKAdapt.rate, 50 * ZKAdapt.rate))
        }
        

        let text = "登录即代表您已同意《用户协议》、《隐私政策》\n及《儿童个人信息保护规则及监护人须知》"
        if #available(iOS 15.0, *) {
//            let text = "登录即代表您已同意"
            setiOS15PrivicyContent(text)
        } else {
//            let text = "登录即代表您已同意《用户协议》、《隐私政策》\n及《儿童个人信息保护规则及监护人须知》"
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
        textView.attributedText = attrStr
        //
    }
    
    //    @available(iOS15.0,*)
    @available(iOS 15.0,*)
    func setiOS15PrivicyContent(_ info: String) {
        
//        let style = NSMutableParagraphStyle()
//        style.lineSpacing = 4
//        let attributeContainer = AttributeContainer([.foregroundColor:UIColor.zk85848B,
//                                                     .font:UIFont.regular(14 * ZKAdapt.rate),
//                                                     .paragraphStyle:style])
       
        var attributedString = AttributedString(info)
        
        attributedString.foregroundColor = .zk85848B

        if let userRange = attributedString.range(of: "《用户协议》、《"),
           let userUrl = URL(string: "uesrProt://") {
            attributedString[userRange].link = userUrl
            attributedString[userRange].foregroundColor = .black
            
        }
//        guard let userRange = iOS15Att.range(of: "《用户协议》") else { return }
//        iOS15Att[userRange].foregroundColor = .red
        
        if let userUrl = URL(string: "uesrProtorl://") {
            
            // 值类型；
//            var user = iOS15Att[userRange]
//            user.foregroundColor = .red
//            scope.font = .medium16
//            scope.foregroundColor = .red
//            scope.link = userUrl
            
//            iOS15Att[usStr].font = UIFont.regular14
//            
//            iOS15Att[usStr].foregroundColor = .red
//            iOS15Att[usStr].link = userUrl
            
//            var con = AttributeContainer()
//            con.foregroundColor = .red
//            con.font = .medium16
//            iOS15Att.mergeAttributes(con)
        }
        
        
        
//        旧方案
//        let linkContainer = AttributeContainer([
//                                                .font:UIFont.regular(14 * ZKAdapt.rate),
//                                                .link:"uesrProtorl://",
//                                                .foregroundColor:UIColor.black,
//                                                .paragraphStyle:style])
//        var userPro = AttributedString("《用户协议》",attributes:linkContainer)
//        userPro.foregroundColor = .red
//        
//        iOS15Att.append(userPro)
//        iOS15Att.append(AttributedString("、《隐私政策》\n",attributes:linkContainer))
//        iOS15Att.append(AttributedString("和《儿童个人信息保护规则及监护人须知》",attributes:linkContainer))
        textView.attributedText = NSAttributedString(attributedString)
    }
    
    lazy var textView: UITextView = {
        let t = UITextView()
        //        l.textAlignment = .center
//        if #available(iOS 13.0, *) {
//            t.backgroundColor = .systemGray2
//        } else {
//            // Fallback on earlier versions
//            t.backgroundColor = .systemGray
//        }
        t.delegate = self
        t.isEditable = false
//        l.textColor = .zk85848B
//        l.numberOfLines = 0
        return t
    }()
    
}

extension ViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        print("click: \(URL)")
        
        return true
    }
}

@available(iOS 17.0,*)
#Preview("TextView", traits: .defaultLayout, body: {
    ViewController()
})
