//
//  UIViewController+Extension.swift
//  DemoProject
//
//  Created by Vijay Yadav on 13/08/22.
//  Copyright © 2021 Vijay Yadav. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func setBackgroundImage(_ image: UIImage?, contentMode: UIView.ContentMode) {
        
        let backgroundImage = UIImageView(frame: self.view.bounds)
        backgroundImage.image = image
        backgroundImage.contentMode = contentMode
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    func topMostViewController() -> UIViewController {
        
        if let presented = self.presentedViewController {
            return presented.topMostViewController()
        }
        
        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.topMostViewController() ?? navigation
        }
        
        if let tab = self as? UITabBarController {
            return tab.selectedViewController?.topMostViewController() ?? tab
        }
        
        return self
    }
}
