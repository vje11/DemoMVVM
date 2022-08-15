//
//  String+Extension.swift
//  DemoProject
//
//  Created by Vijay Yadav on 13/08/22.
//  Copyright © 2021 Vijay Yadav. All rights reserved.
//

import Foundation


extension String{
    
    var localized : String {
        return  localizedString(lang: "en")
    }
    
    private func localizedString(lang:String) ->String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
