//  
//  ProductsViewModelProtocol.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation
import RxCocoa
import RxSwift
import Kingfisher
protocol ProductsViewModelProtocol {
    var products: BehaviorRelay<[ProductModel]>{get set}
    var query: BehaviorRelay<String> { get set }
    var filters: BehaviorRelay<ProductFilters> { get set }
}
