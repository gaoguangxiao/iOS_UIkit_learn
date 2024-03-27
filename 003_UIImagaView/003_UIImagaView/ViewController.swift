//
//  ViewController.swift
//  003_UIImagaView
//
//  Created by 高广校 on 2024/3/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(iconImageView)
//        iconImageView.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        iconImageView.sizeToFit()
        iconImageView.center = view.center
        
        iconImageView.addSymbolEffect(.variableColor)
        
        
    }

    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "wifi")
//        imageView.contentMode = .scaleAspectFit
//        imageView.addSymbolEffect(.variableColor.iterative)
       
//        imageView.setSymbolImage(.init(systemName: "pause")!, contentTransition: .replace.offUp)

        return imageView
    }()
    

}


@available(iOS 17.0, *)
#Preview("Vc", body: {
    return ViewController()
})
