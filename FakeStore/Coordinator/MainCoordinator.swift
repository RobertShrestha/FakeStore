//
//  AppCoordinator.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 1/4/21.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    /// Initialization of coordinator
    /// - Parameter navController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    /// Start function
    func start() {
        let client = WebServices.shared
        let service = LoginService(client: client)
        let viewModel = LoginViewModel(withLogin: service)
        let viewController = LoginView.instantiate()
        viewController.coordinator = self
        viewController.viewModel = viewModel
        viewModel.viewType = viewController
        navigationController.pushViewController(viewController, animated: true)
        
//        if UserDefaultsConstants.firstTime {
//            introScreen()
//        } else {
//            if UserDefaultsConstants.hasUserLoggedIn {
//                if UserDefaultsConstants.idToken != nil
//                    && UserDefaultsConstants.accessToken != nil
//                    && UserDefaultsConstants.isSetupComplete {
//                        goToDashboard()
//                    } else {
//                        registration()
//                    }
//            } else {
//                goToDashboard()
//            }
//        }
    }

    func goToDashboard() {
        let coordinator = DashboardTabBarCoordinator(navigationController: navigationController)
        coordinator.parenetCoordinator = self
        self.childCoordinators.append(coordinator)
        coordinator.start()
    }
//    /// Redirect to Intro screen flow
//    func introScreen() {
//        let coordinator = IntroScreenCoordinator(navController: navigationController)
//        coordinator.parentCoordinator = self
//        self.childCoordinators.append(coordinator)
//        coordinator.start()
//    }
//    /// Redirect to registration flow
//    func registration() {
//        let registrationCoordinator = RegistrationFlowCoordinator(navigationController: self.navigationController)
//        registrationCoordinator.parenetCoordinator = self
//        self.childCoordinators.append(registrationCoordinator)
//        registrationCoordinator.start()
//    }
//    /// Redirect to Dashboard view
//    func goToDashboard() {
//        let dashbaordCoordinator = DashboardTabBarCoordinator(navigationController: navigationController)
//        dashbaordCoordinator.parenetCoordinator = self
//        self.childCoordinators.append(dashbaordCoordinator)
//        dashbaordCoordinator.start()
//    }
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
