//
//  ViewController.swift
//  iOS17_UIHoverStyle
//
//  Created by 高广校 on 2024/3/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    lazy var redView: UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 200, width: 190, height: 190))
//        view.backgroundColor = UIColor(named: "primary")
        view.backgroundColor = .primary

        if #available(iOS 17.0, *) {
            // iOS17新增UIHoverStyle，可以设置Hover的效果与形状（UIShape）
    //        let hoverStyle = UIHoverStyle(effect: .highlight, shape: .capsule)
            let hoverStyle = UIHoverStyle(__shape: .capsule)
            // iOS17新增，鼠标移动到UIView之上的效果
            view.hoverStyle = hoverStyle
        } else {
            // Fallback on earlier versions
        }

        let hoverGes = UIHoverGestureRecognizer(target: self, action: #selector(hoverGesture))
        view.addGestureRecognizer(hoverGes)
        return view
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.addSubview(redView)
        
        let hover = UIHoverGestureRecognizer(target: self, action: #selector(hovering(_:)))
        button.addGestureRecognizer(hover)
        
        self.view.backgroundColor = .primary
//        let myTraits = UITraitCollection(userInterfaceIdiom: .pad)
        //判断当前设备的配置
//        print("userInterfaceIdiom: \(myTraits.userInterfaceIdiom)")
        
//        let viewControllerTraitCollection = self.traitCollection
//        print("viewControllerTraitCollection: \(viewControllerTraitCollection.userInterfaceIdiom)")
        //模拟器为iapd viewControllerTraitCollection: UIUserInterfaceIdiom(rawValue: 1)
        
        let sc = UIScreen.main.currentMode
        print("sc:\(sc?.pixelAspectRatio)")
        
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let windowscreen = windowScene?.screen
//        windowscreen.currentMode?.pixelAspectRatio
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }
    
    @objc func hoverGesture() {
        print("hover")
    }
    
    @objc
        func hovering(_ recognizer: UIHoverGestureRecognizer) {
            switch recognizer.state {
            case .began, .changed:
                button.titleLabel?.textColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
            case .ended:
                button.titleLabel?.textColor = UIColor.link
            default:
                break
            }
        }
}


//#Preview("Vc", body: {
//    return ViewController()
//})
