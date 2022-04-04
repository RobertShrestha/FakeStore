//
//  MockProductDetailService.swift
//  FakeStoreTests
//
//  Created by Robert Shrestha on 4/4/22.
//

import Foundation
import RxSwift
@testable import FakeStore
class MockProductDetailService: ProductDetailServiceProtocol {
    var client: WebServices
    var storage: StorageClient

    public init(client: WebServices = WebServices.shared, storageClient: StorageClient = StorageClient(storage: UserDefaultStorage(products: []))) {
        self.client = client
        self.storage = storageClient
    }
    let response =
"""

  {
    "id": 1,
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "rating": {
      "rate": 3.9,
      "count": 120
    }
  }
"""
    func getProductDetail<T: Codable>(resource: Resource<T>) -> Single<T> {
        return Single.create(subscribe: { emitter in

            do {
                let jsonData = self.response.data(using: .utf8)
                guard let data = jsonData else { fatalError() }

                let value = try JSONDecoder().decode(T.self, from: data)
                emitter(.success(value))
            }catch(let error) {
                emitter(.failure(APIErrors.seralizationError(error: error.localizedDescription as! Error)))
            }
            return Disposables.create()
        })
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
