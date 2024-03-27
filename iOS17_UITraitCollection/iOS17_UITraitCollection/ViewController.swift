//
//  ViewController.swift
//  iOS17_UITraitCollection
//
//  Created by 高广校 on 2024/3/26.
//

import UIKit
import GGXSwiftExtension

extension UIColor {
    static var viewBackgroundColor: UIColor {
        .init { (trait: UITraitCollection) -> UIColor in
            if trait.userInterfaceStyle == .dark {
                return .white
            }
            return .black
        }
    }
    
    static var viewControllerBackgroundColor: UIColor {
        .init { (trait: UITraitCollection) -> UIColor in
            if trait.userInterfaceStyle == .dark {
                return .red
            }
            return .green
        }
    }
}

class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // iOS17之后
        registerForTraitChanges([UITraitUserInterfaceStyle.self], action: #selector(configureView))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: iOS17之前，被废弃
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {}
    
    @objc private func configureView() {
        backgroundColor = .viewBackgroundColor
    }
}


class ViewController: UIViewController {
    
    lazy var customView: CustomView = {
        let customView = CustomView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        customView.center = view.center
        customView.backgroundColor = .viewBackgroundColor
        return customView
    }()
    
    @IBOutlet weak var 旋转: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .viewControllerBackgroundColor
//        view.addSubview(customView)
        
        // iOS17之后
        registerForTraitChanges([UITraitUserInterfaceStyle.self]) { (self: Self, previousTraitCollection: UITraitCollection) in
            self.view.backgroundColor = .viewControllerBackgroundColor
            
           let horizontalSizeClass = previousTraitCollection.horizontalSizeClass
        }
        
    }
    
    
    @IBAction func 旋转屏幕(_ sender: UIButton) {
        
        if let app = UIApplication.shared.delegate as? AppDelegate {
            if app.orientationMask == .landscapeRight{
                app.orientationMask = .portrait
            } else  {
                app.orientationMask = .landscapeRight
            }
            self.p_switchOrientationWithLaunchScreen(orientation: app.orientationMask)
        }
    }
 
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        
        //size: (390.0, 844.0)
        print("size: \(size)")
    }
}

