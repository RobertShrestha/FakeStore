//  
//  ProductDetailService.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/4/22.
//

import Foundation
import RxSwift
class ProductDetailService: ProductDetailServiceProtocol {
    var client: WebServices
    var storage: StorageClient

    public init(client: WebServices = WebServices.shared, storageClient: StorageClient = StorageClient(storage: UserDefaultStorage(products: []))) {
        self.client = client
        self.storage = storageClient
    }

    func getProductDetail<T: Codable>(resource: Resource<T>) -> Single<T> {
        return client.load(resource: resource, withToken: false)
    }
    func addProduct(model: ProductModel) {
        self.storage.addArticle(with: model)
    }
    func removeProduct(model: ProductModel) {
        self.storage.removeArticle(with: model)
    }
    func getProductBookmark(model: ProductModel) -> Bool {
        self.storage.isBookmarked(with: model)
    }
}
