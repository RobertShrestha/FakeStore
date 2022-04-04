//
//  ProductCoordinator.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation
import UIKit
import RxSwift

class ProductCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parenetCoordinator: DashboardTabBarCoordinator?
    var disposeBag = DisposeBag()
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let client = WebServices.shared
        let service = ProductsService(client: client)
        let viewModel = ProductsViewModel(withProducts: service)
        let viewController = ProductsView.instantiate()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        viewModel.viewType = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    func goToFilter(productVC: ProductsView) {
        let storyboard = UIStoryboard(name: "ProductsView", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ProductFilterViewController") as? ProductFilterViewController else { return }
        viewController.filters.subscribe(onNext: {
            productVC.viewModel?.filters.accept($0)
        }).disposed(by: disposeBag)
        productVC.present(viewController, animated: true, completion: nil)
    }
    func goToProductDetail(productModel: ProductModel, navigatonController: UINavigationController) {
        let client = WebServices.shared
        let storageClient = StorageClient(storage: UserDefaultStorage(products: []))
        let service = ProductDetailService(client: client, storageClient: storageClient)
        let viewModel = ProductDetailViewModel(withProductDetail: service, productModel: productModel)
        let viewController = ProductDetailView.instantiate()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        viewController.model = productModel
        viewModel.viewType = viewController
        navigatonController.pushViewController(viewController, animated: true)
        
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
