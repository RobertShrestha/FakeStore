//  
//  LoginModel.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation

struct LoginModel: Codable {
    var token: String?
}

struct RequestLoginModel: Codable {
    var username: String
    var password: String
}
