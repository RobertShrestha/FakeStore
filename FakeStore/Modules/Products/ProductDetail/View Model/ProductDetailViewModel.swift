//  
//  ProductDetailViewModel.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/4/22.
//

import Foundation
import RxSwift
import RxCocoa
class ProductDetailViewModel: ProductDetailViewModelProtocol {
    // MARK: - Variables declaration
    weak var viewType: ProductDetailViewProtocol?

    private let service: ProductDetailServiceProtocol
    var productDetail = BehaviorRelay<ProductModel?>(value: nil)
    var bookMarkedButtonTapped = PublishSubject<Void>()
    var isBookmarked = BehaviorRelay<Bool>(value: false)
    var disposeBag = DisposeBag()

    private var model: [ProductDetailModel] = [ProductDetailModel]() {
        didSet {
            self.count = self.model.count
        }
    }

    var productModel: ProductModel
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
    init(withProductDetail serviceProtocol: ProductDetailServiceProtocol = ProductDetailService(), productModel: ProductModel ) {
        self.service = serviceProtocol
        self.productModel = productModel
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.networkStatusChanged(_:)),
                                               name: NSNotification
                                                .Name(rawValue: ReachabilityStatusChangedNotification),
                                               object: nil)
        Reach().monitorReachabilityChanges()
        getBookmarkInfo()
        binding()
        getProductDetail()
    }

    // MARK: Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }
    func getBookmarkInfo() {
        let bookMarked = self.service.getProductBookmark(model: self.productModel)
        self.isBookmarked.accept(bookMarked)
    }
    func bookMarkProduct() {
        if self.isBookmarked.value {
            self.service.removeProduct(model: self.productModel)
        } else {
            self.service.addProduct(model: self.productModel)
        }
    }
    func binding() {
        self.bookMarkedButtonTapped.asObserver().subscribe(onNext: {
            self.bookMarkProduct()
            var value = self.isBookmarked.value
            value.toggle()
            self.isBookmarked.accept(value)
        }).disposed(by: disposeBag)
    }

    // MARK: - Example Func
    func getProductDetail() {
        switch networkStatus {
        case .offline:
            self.isDisconnected = true
        case .online:
            serviceCall(id: productModel.id ?? 0)
            // call your service here
        default:
            break
        }
    }
    func serviceCall(id: Int) {
        guard let url = URLBuilder()
                .setPath(paths: .products)
                .setIdPath(id: "\(id)")
                .build() else { return }
        var resource = Resource<ProductModel>(url: url)
        resource.httpMethod = .get
        let response = self.service.getProductDetail(resource: resource)
        viewType?.showProgressHud()
        _  = response.subscribe(onSuccess: { model in
            self.productDetail.accept(model)
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

extension ProductDetailViewModel {

}
