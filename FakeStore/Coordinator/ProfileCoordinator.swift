//
//  ProfileCoordinator.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/4/22.
//

import Foundation
import RxSwift

class ProfileCoordinator: Coordinator {


    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var parenetCoordinator: DashboardTabBarCoordinator?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let viewController = ProfileView.instantiate()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
    func didFinishProfile() {
        self.parenetCoordinator?.goToLogin()
        self.parenetCoordinator?.childDidFinish(self)
        self.parenetCoordinator?.didFinishDashboardTab()

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
