//  
//  BookmarkViewModel.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/4/22.
//

import Foundation
import RxSwift
import RxCocoa
class BookmarkViewModel: BookmarkViewModelProtocol {
    // MARK: - Variables declaration
    weak var viewType: BookmarkViewProtocol?

    private let service: BookmarkServiceProtocol

    private var model: [BookmarkModel] = [BookmarkModel]() {
        didSet {
            self.count = self.model.count
        }
    }

    var bookmarkedProduct = BehaviorRelay<[ProductModel]>(value: [])

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
    init(withBookmark serviceProtocol: BookmarkServiceProtocol = BookmarkService() ) {
        self.service = serviceProtocol

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.networkStatusChanged(_:)),
                                               name: NSNotification
                                                .Name(rawValue: ReachabilityStatusChangedNotification),
                                               object: nil)
        Reach().monitorReachabilityChanges()
        serviceCall()

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
            getBookmarkedProduct()
            // call your service here
        default:
            break
        }
    }
    func getBookmarkedProduct() {
        let products = self.service.getAllBookmarked()
        self.bookmarkedProduct.accept(products)
    }
}

extension BookmarkViewModel {

}
