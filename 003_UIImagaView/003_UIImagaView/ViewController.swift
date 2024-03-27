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
        view.addSubview(resourceView)
        resourceView.sizeToFit()
        resourceView.center = view.center
    }

    lazy var resourceView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .loginTopIcon)
        return imageView
    }()
}


@available(iOS 17.0, *)
#Preview("Vc", body: {
    return ViewController()
})
