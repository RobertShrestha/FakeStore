//  
//  BookmarkServiceProtocol.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/4/22.
//

import Foundation

protocol BookmarkServiceProtocol {
    var client: WebServices {get set }
    func getAllBookmarked() -> [ProductModel]
}
