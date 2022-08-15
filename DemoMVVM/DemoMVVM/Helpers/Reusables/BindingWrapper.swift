//
//  BindingWrapper.swift
//  Assignment
//
//  Created by Vijay Yadav on 29/12/20.
//

import Foundation

class DWrapper<T> {
    
    typealias Listener = (T) -> ()
    var listener: Listener?

    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ v: T) {
        value = v
    }
}
