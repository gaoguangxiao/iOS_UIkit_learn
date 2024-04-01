//
//  SwiftUIView_text.swift
//  002_UITextView
//
//  Created by 高广校 on 2024/3/28.
//

import SwiftUI

struct SwiftUIView_text: View {
    
    let text = "登录即代表您已同意《用户协议》、《隐私政策》\n及《儿童个人信息保护规则及监护人须知》"
    
    @State var clickText = "登录[点击](uesrProtorl://)"
    
    @available(iOS 15, *)
    var content: AttributedString {
        var attributedString = AttributedString(text)
        attributedString.foregroundColor = .zk85848B

        if let userRange = attributedString.range(of: "《用户协议》、"),
           let userUrl = URL(string: "uesrProt://") {
            attributedString[userRange].foregroundColor = .black
            attributedString[userRange].link = userUrl
        }
        
        return attributedString
    }
    
//    @available(iOS 14, *)
//    @Environment(\.openURL) private var openURL
    
    ///
    var body: some View {
        VStack {
//            Text(content)
//                .environment(\.openURL, OpenURLAction { url in
//                    
//                })
//               
            
            if #available(iOS 15, *) {
                Text(content)
                    .environment(\.openURL, OpenURLAction { url in
                        
                        let path = url.absoluteString
                        
                        print("todo something: \(url)")
                        
                        if path.hasPrefix("uesrProtorl://") {
                            print("点击用户协议")
                            
                        } else if path.hasPrefix("222") {
                            print("222...")
                            
                        }
                        return .handled
                        
                    })
                
                Text("登录[点击](uesrProtorl://)")
                    .onOpenURL(perform: { url in
                        handleOpenURL(url)
                    })
            } else {
                // Fallback on earlier versions
//                if #available(iOS 14.0, *) {
//                    Text("登录[点击](uesrProtorl://)")
//                        .onOpenURL(perform: { url in
//                            handleOpenURL(url)
//                        })
//                } else {
//                    // Fallback on earlier versions
//                }
            }
            
        }
        .foregroundColor(.red)
        
    }
    ///
    //    var body: some View {
    //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    //
    //    }
    
    ///在最外层View
//    .onOpenURL { (url) in
//        handleOpenURL(url)
//    }

    private func handleOpenURL(_ url: URL) {
        
        print("todo something")
        
        switch url.absoluteString {
        case "uesrProtorl://": 
            print("todo something")
            break
                //todo something
            default:
                break
         }
    }

}

#Preview {
    SwiftUIView_text()
}
