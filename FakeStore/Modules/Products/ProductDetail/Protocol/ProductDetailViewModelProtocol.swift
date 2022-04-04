//  
//  ProductDetailViewModelProtocol.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/4/22.
//

import Foundation
import RxSwift
import RxCocoa
protocol ProductDetailViewModelProtocol {
    var isBookmarked: BehaviorRelay<Bool> {get set}
    var productDetail: BehaviorRelay<ProductModel?>{get set}
    var bookMarkedButtonTapped: PublishSubject<Void>{get set}
}
