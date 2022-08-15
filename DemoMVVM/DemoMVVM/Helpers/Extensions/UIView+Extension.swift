//
//  UIView+Extension.swift
//  DemoProject
//
//  Created by Vijay Yadav on 13/08/22.
//  Copyright © 2021 Vijay Yadav. All rights reserved.
//

import UIKit


extension UIView{
    
    func displaySpinner(color: UIColor = .red) -> UIView {
          
          let ai = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
          ai.color = color
          ai.startAnimating()
          ai.center.x = self.center.x
          ai.center.y = self.center.y
          self.addSubview(ai)
          self.bringSubviewToFront(ai)
          return ai
      }
      
      func removeSpinner(spinner :UIView) {
          DispatchQueue.main.async {
              spinner.removeFromSuperview()
          }
      }
    
     func round(radius : CGFloat) {
        self.layer.masksToBounds = true
        self.layoutIfNeeded()
        self.layer.cornerRadius = radius
    }
        
    func setBorder(width: CGFloat, color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}



extension UIApplication {
  func topMostViewController() -> UIViewController? {
    return UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController?.topMostViewController()
  }
}
