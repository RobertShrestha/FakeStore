//
//  BookmarkCoordinator.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/4/22.
//

import Foundation
import UIKit
import RxSwift

class BookmarkCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parenetCoordinator: DashboardTabBarCoordinator?
    var disposeBag = DisposeBag()
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let client = WebServices.shared
        let storageClient = StorageClient(storage: UserDefaultStorage(products: []))
        let service = BookmarkService(client: client, storageClient: storageClient)
        let viewModel = BookmarkViewModel(withBookmark: service)
        let viewController = BookmarkView.instantiate()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        viewModel.viewType = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    func goToProductDetail(productModel: ProductModel) {
        debugPrint(self.parenetCoordinator?.childCoordinators)
        guard let parentCoordinator = self.parenetCoordinator else { return }
        let productCoordiantar = parentCoordinator.childCoordinators.filter { coordinator in
            coordinator is ProductCoordinator
        }
        guard let newCoordiantor = productCoordiantar.first, let co = newCoordiantor as? ProductCoordinator else { return
        }
        co.goToProductDetail(productModel: productModel, navigatonController: navigationController)
//        let client = WebServices.shared
//        let storageClient = StorageClient(storage: UserDefaultStorage(products: []))
//        let service = ProductDetailService(client: client, storageClient: storageClient)
//        let viewModel = ProductDetailViewModel(withProductDetail: service, productModel: productModel)
//        let viewController = ProductDetailView.instantiate()
//        viewController.coordinator = self
//        viewController.viewModel = viewModel
//        viewController.model = productModel
//        viewModel.viewType = viewController
//        navigationController.pushViewController(viewController, animated: true)

    }
    func didFinishProduct() {
        self.parenetCoordinator?.childDidFinish(self)
    }
    /// remove child
    /// - Parameter child: Coordinator
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
