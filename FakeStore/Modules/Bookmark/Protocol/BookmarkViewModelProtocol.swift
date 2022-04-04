//  
//  BookmarkViewModelProtocol.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/4/22.
//

import Foundation
import RxSwift
import RxCocoa
protocol BookmarkViewModelProtocol {
    var bookmarkedProduct: BehaviorRelay<[ProductModel]> {get set}
    func serviceCall()
}
