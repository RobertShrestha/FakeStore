//  
//  LoginServiceProtocol.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation
import RxSwift
protocol LoginServiceProtocol {

    var client: WebServices {get set }
    func doLogin<T: Codable>(resource: Resource<T>) -> Single<T>
}
