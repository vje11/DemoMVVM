//
//  AppEnums.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import Foundation

enum LandingListings: String, CaseIterable {
    case PullRequests = "Closed Pull Requests"
    case Others = "All Pull Requests"
    
    var value: String { return rawValue }
}
