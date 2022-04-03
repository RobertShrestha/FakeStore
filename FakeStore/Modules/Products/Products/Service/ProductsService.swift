//  
//  ProductsService.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation
import RxSwift
class ProductsService: ProductsServiceProtocol {
    var client: WebServices

    public init(client: WebServices = WebServices.shared) {
        self.client = client
    }

    func getAllProducts<T: Codable>(resource: Resource<T>) -> Single<T> {
        return client.load(resource: resource, withToken: false)
    }
}
