//  
//  BookmarkService.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/4/22.
//

import Foundation
import RxSwift
class BookmarkService: BookmarkServiceProtocol {
    var client: WebServices
    var storageClient: StorageClient

    public init(client: WebServices = WebServices.shared, storageClient: StorageClient = StorageClient(storage: UserDefaultStorage(products: []))) {
        self.client = client
        self.storageClient = storageClient
    }
    func getAllBookmarked() -> [ProductModel] {
        self.storageClient.loadProducts()
    }
}
