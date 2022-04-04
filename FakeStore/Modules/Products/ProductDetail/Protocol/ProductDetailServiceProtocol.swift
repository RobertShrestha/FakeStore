//  
//  ProductDetailServiceProtocol.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/4/22.
//

import Foundation
import RxSwift
protocol ProductDetailServiceProtocol {

    var client: WebServices {get set }
    func getProductDetail<T: Codable>(resource: Resource<T>) -> Single<T>
    func getProductBookmark(model: ProductModel) -> Bool
    func addProduct(model: ProductModel)
    func removeProduct(model: ProductModel)

}
