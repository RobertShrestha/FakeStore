//  
//  ProductsServiceProtocol.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation
import RxSwift
protocol ProductsServiceProtocol {

    var client: WebServices {get set }
    func getAllProducts<T: Codable>(resource: Resource<T>) -> Single<T>
}
