//  
//  LoginService.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation
import RxSwift
import UIKit
class LoginService: LoginServiceProtocol {
    var client: WebServices

    public init(client: WebServices = WebServices.shared) {
        self.client = client
    }

    func doLogin<T: Codable>(resource: Resource<T>) -> Single<T> {
        return client.load(resource: resource, withToken: false)
    }
}
