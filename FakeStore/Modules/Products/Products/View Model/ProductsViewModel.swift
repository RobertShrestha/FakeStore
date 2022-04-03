//  
//  ProductsViewModel.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation
import RxRelay
import RxSwift
import RxCocoa
class ProductsViewModel: ProductsViewModelProtocol {
    // MARK: - Variables declaration
    weak var viewType: ProductsViewProtocol?

    private let service: ProductsServiceProtocol

    private var model: [ProductModel] = [ProductModel]() {
        didSet {
            self.count = self.model.count
        }
    }

    var products = BehaviorRelay<[ProductModel]>(value: [])
    var query = BehaviorRelay<String>(value: "")
    var filters = BehaviorRelay<ProductFilters>(value: ProductFilters(minValue: 0, maxValue: 0, category: .none, rating: 0.0))
   
    var originalProducts: [ProductModel] = []
    var disposeBag = DisposeBag()
    /// Count your data in model
    var count: Int = 0

    // MARK: - Network checking

    /// Define networkStatus for check network connection
    var networkStatus = Reach().connectionStatus()

    /// Define boolean for internet status, call when network disconnected
    var isDisconnected: Bool = false {
        didSet {
            self.viewType?.alert(message: Constants.noInternetConnection)
        }
    }
    // MARK: - Initialization Method
    init(withProducts serviceProtocol: ProductsServiceProtocol = ProductsService() ) {
        self.service = serviceProtocol

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.networkStatusChanged(_:)),
                                               name: NSNotification
                                                .Name(rawValue: ReachabilityStatusChangedNotification),
                                               object: nil)
        Reach().monitorReachabilityChanges()
        serviceCall()
        bindings()
    }

    func bindings() {
        self.filters.subscribe(onNext: { filters in
            let categoryFilters = self.filterUsingCategory(products: self.originalProducts, filters: filters)
            let ratingFilters = self.filterUsingRating(products: categoryFilters, filters: filters)
            let priceRangeFiltered = self.filterUsingPrice(products: ratingFilters, filters: filters)
            self.products.accept(priceRangeFiltered)
        }).disposed(by: disposeBag)
        self.query.subscribe(onNext: { [self] query in
            print(query)
            if query.count < 1 {
                self.products.append(contentsOf: originalProducts)
            } else {
                let filteredArray = self.originalProducts.filter { product in
                    product.title?.contains(find: query) ?? false
                }
                self.products.accept(filteredArray)
            }
        }).disposed(by: disposeBag)
    }
    func filterUsingCategory(products: [ProductModel], filters: ProductFilters) -> [ProductModel]  {
        return products.filter { model in
            if filters.category == .none {
                return true
            } else {
                return  model.category == filters.category
            }
        }
    }
    func filterUsingRating(products: [ProductModel], filters: ProductFilters) -> [ProductModel]  {
        return products.filter { model in
            model.rating?.rate ?? 0.0 >= filters.rating
        }
    }
    func filterUsingPrice(products: [ProductModel], filters: ProductFilters) -> [ProductModel]  {
        return products.filter { model in
            if filters.minValue == 0.0 && filters.maxValue == 0.0 {
                return true
            } else {
                return filters.maxValue >= (model.price ?? 0.0) && filters.minValue <= (model.price ?? 0.0)
            }
        }
    }
    // MARK: Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }

    // MARK: - Example Func
    func serviceCall() {
        switch networkStatus {
        case .offline:
            self.isDisconnected = true
        case .online:
            getAllProducts()
        default:
            break
        }
    }
    func getAllProducts() {
        guard let url = URLBuilder()
                .setPath(paths: .products)
                .build() else { return }
        var resource = Resource<[ProductModel]>(url: url)
        resource.httpMethod = .get
        let response = self.service.getAllProducts(resource: resource)
        viewType?.showProgressHud()
        _  = response.subscribe(onSuccess: { model in
            self.products.append(contentsOf: model)
            self.originalProducts.append(contentsOf: model)
            self.viewType?.hideProgressHud()
        }, onFailure: { error in
            print(error)
            let error = error as? APIErrors
            switch error {
            case .seralizationError(let error):
                self.viewType?.alert(message: error.localizedDescription, title: nil, okAction: nil)
            case .apiError(let message):
                self.viewType?.alert(message: message, title: nil, okAction: nil)
            case .domainError(let error):
                self.viewType?.alert(message: error.localizedDescription, title: nil, okAction: nil)
            case .none:
                log.error("APIErrors not found")
            }
            self.viewType?.hideProgressHud()
        })
    }
}

extension ProductsViewModel {

}
