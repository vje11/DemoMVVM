//
//  PRResponse.swift
//  DemoMVVM
//
//  Created by Vijay Yadav on 13/08/22.
//

import Foundation

struct PRResponse: Codable {
    var title: String?
    var user: User?
    var createdDate: String?
    var closedDate: String?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case user
        case createdDate = "created_at"
        case closedDate = "closed_at"
    }
}

struct User: Codable {
    var name: String?
    var image: String?

    enum CodingKeys: String, CodingKey {
        case name = "login"
        case image = "avatar_url"
    }
}
