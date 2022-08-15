//
//  AppColors.swift
//  DemoProject
//
//  Created by Vijay Yadav on 13/08/22.
//  Copyright © 2021 Vijay Yadav. All rights reserved.
//

import UIKit

struct AppColors {
    
    static let titleColor = UIColor.black
    static let subtitleColor = UIColor.lightgrey
    static let viewTransparentColor = UIColor.clear
    static let patternImageColor = UIColor(patternImage: AppImages.backgroundImage!)
}


extension UIColor {
    
    static var black: UIColor {
        return UIColor(red: 0.227, green: 0.227, blue: 0.235, alpha: 1)
    }
    static var lightgrey: UIColor {
        return UIColor(red: 0.329, green: 0.329, blue: 0.388, alpha: 1)
    }
}
