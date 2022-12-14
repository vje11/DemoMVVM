//
//  Storyboard.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import UIKit


enum Storyboard: String{
    case Main
}


extension UIViewController
{
    class func instantiateFromStoryboard(_ name: Storyboard = .Main) -> Self
    {
        return instantiateFromStoryboardHelper(name)
    }

    fileprivate class func instantiateFromStoryboardHelper<T>(_ name: Storyboard) -> T
    {
        let storyboard = UIStoryboard(name: name.rawValue, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! T
        return controller
    }
}
