//
//  StorageHelper.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//

import Foundation

protocol Storage {
    var products: [ProductModel] {get set}
    func load() -> [ProductModel]
    mutating func remove(product: ProductModel)
    mutating func save(product: ProductModel)
    func isBookmarked(product: ProductModel) -> Bool
}

struct UserDefaultStorage: Storage {

    var products: [ProductModel]

    
    func load() -> [ProductModel] {
        let bookmarkedProducts = UserDefaultsConstants.bookmarkedProducts.decoded() as [ProductModel]
        return bookmarkedProducts
    }

    mutating func remove(product: ProductModel) {
        let bookmarkedProducts = UserDefaultsConstants.bookmarkedProducts.decoded() as [ProductModel]
        let filteredProducts = bookmarkedProducts.filter({$0 != product})
        UserDefaultsConstants.bookmarkedProducts = filteredProducts.toData()
    }

    mutating func save(product: ProductModel) {

        if UserDefaultsConstants.bookmarkedProducts == Data() {
            products = []
        }else {
            products = UserDefaultsConstants.bookmarkedProducts.decoded() as [ProductModel]
        }
        products.append(product)
        UserDefaultsConstants.bookmarkedProducts = products.toData()
    }
    func isBookmarked(product: ProductModel) -> Bool {
        if UserDefaultsConstants.bookmarkedProducts == Data() {
            return false
        } else {
            let bookmarkedProducts = UserDefaultsConstants.bookmarkedProducts.decoded() as [ProductModel]
            return bookmarkedProducts.contains(product)
        }
    }

}

struct StorageClient {
    var storage: Storage

    init(storage: Storage) {
        self.storage = storage
    }

    func loadProducts() -> [ProductModel] {
        return storage.load()
    }
    mutating func addArticle(with product: ProductModel) {
        return storage.save(product: product)
    }
    mutating func removeArticle(with product: ProductModel) {
        return storage.remove(product: product)
    }
    func isBookmarked(with product: ProductModel) -> Bool {
        return storage.isBookmarked(product: product)
    }
}
