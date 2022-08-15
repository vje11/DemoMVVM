//
//  PullRequestViewModel.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import Foundation
import UIKit

struct PullRequestViewModel {
    
    var title: String
    var userName: String
    var userImage: String
    var createdDate: String
    var closedDate: String
    
    init(listModel: PRResponse){
        title = listModel.title ?? ""
        userName = listModel.user?.name ?? ""
        userImage = listModel.user?.image ?? ""
        createdDate = listModel.createdDate ?? ""
        closedDate = listModel.closedDate ?? ""
    }
}

