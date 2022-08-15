//
//  AppEnums.swift
//  DemoProject
//
//  Created by Vijay Yadav on 13/08/22.
//  Copyright © 2021 Vijay Yadav. All rights reserved.
//

import Foundation

enum LandingListings: String, CaseIterable {
    case PullRequests = "Closed Pull Requests"
    case Others = "All Pull Requests"
    
    var value: String { return rawValue }
}
