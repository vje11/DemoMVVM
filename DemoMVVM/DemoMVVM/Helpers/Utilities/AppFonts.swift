
//
//  AppFOnts.swift
//  DemoProject
//
//  Created by Vijay Yadav on 13/08/22.
//  Copyright © 2021 Vijay Yadav. All rights reserved.
//

import UIKit


enum AppFonts : String {
    
    case poppinsItalic = "Poppins-Italic"
    case poppinsBoldItalic = "Poppins-BoldItalic"
    case poppinsRegular = "Poppins-Regular"
    case poppinsMedium = "Poppins-Medium"
    case poppinsMediumItalic = "Poppins-MediumItalic"
    case poppinsSemiBold = "Poppins-SemiBold"
}


extension AppFonts {
    
    func withSize(_ fontSize: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    
    func withDefaultSize() -> UIFont {
        return UIFont(name: self.rawValue, size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
    }
}


struct DefaultFonts{
    static let titleFont = AppFonts.poppinsSemiBold.withSize(17.0)
    static let subTitleFont = AppFonts.poppinsMedium.withSize(15.0)
    static let descriptionFont = AppFonts.poppinsMediumItalic.withSize(14.0)
}
