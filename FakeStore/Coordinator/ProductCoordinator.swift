//
//  ProductCoordinator.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation
import UIKit

class ProductCoordinator: Coordinator {


    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parenetCoordinator: MainCoordinator?
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
}
