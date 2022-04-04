//
//  DashboardTabCoordinator.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation
import UIKit
class DashboardTabBarCoordinator: Coordinator {


    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    weak var parenetCoordinator: MainCoordinator?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func start() {
        let dashboardTabController = DashboardTabViewController()

        setupTabBarController(dashboardTabController)
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(dashboardTabController, animated: true)
    }

    fileprivate func setupTabBarController(_ tabBarController: DashboardTabViewController) {
        // Start view
        let startNavigationController = UINavigationController()
        let searchTabBarItem = UITabBarItem(title: "Products", image: UIImage(systemName: "bag"), tag: 0)
        searchTabBarItem.title = "Products"
        startNavigationController.tabBarItem = searchTabBarItem
        let productCoordinator = ProductCoordinator(navigationController: startNavigationController)
        productCoordinator.parenetCoordinator = self
        childCoordinators.append(productCoordinator)
        coordinate(to: productCoordinator)

        let frouthNavigation = UINavigationController()
        let appointmentTabBarItem = UITabBarItem(title: "Bookmark", image: UIImage(systemName: "bookmark"), tag: 1)
        appointmentTabBarItem.title = "Bookmark"
        frouthNavigation.tabBarItem = appointmentTabBarItem
        let bookmarkCoordinator = BookmarkCoordinator(navigationController: frouthNavigation)
        bookmarkCoordinator.parenetCoordinator = self
        childCoordinators.append(bookmarkCoordinator)
        coordinate(to: bookmarkCoordinator)

        let FifthNavigation = UINavigationController()
        let profileTabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.crop.circle.fill"), tag: 2)
        profileTabBarItem.title = "Profile"
        FifthNavigation.tabBarItem = profileTabBarItem
        let profileCoordinator = ProfileCoordinator(navigationController: FifthNavigation)
        profileCoordinator.parenetCoordinator = self
        childCoordinators.append(profileCoordinator)
        coordinate(to: profileCoordinator)

        let controllers = [
            startNavigationController,
            frouthNavigation,
            FifthNavigation
//            contactsNavigationController,
//            historyNavigationController,
//            favouritesNavigationController,
//            settingsNavigationController
        ]
        tabBarController.viewControllers = controllers
    }
    // start each coordinator
    /// - Parameter coordinator: Coordinator
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
    func didFinishDashboardTab() {
        self.parenetCoordinator?.childDidFinish(self)
    }
    func goToLogin() {
        self.navigationController.popViewController(animated: true)
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
