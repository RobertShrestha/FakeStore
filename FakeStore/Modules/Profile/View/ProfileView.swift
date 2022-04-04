//  
//  ProfileView.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import UIKit
import RxSwift

class ProfileView: UIViewController, Storyboarded{

    // OUTLETS HERE
    @IBOutlet var logoutButton: OutlineButton!

    // VARIABLES HERE
    var disposeBag = DisposeBag()
    var viewModel = ProfileViewModel()
    weak var coordinator: ProfileCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
    }
    fileprivate func setupViewModel() {
        self.logoutButton
            .rx
            .tap
            .subscribe(onNext: {
                self.coordinator?.didFinishProfile()
                #warning("Remove this")
//                UserDefaultsConstants.idToken = ""
//                DispatchQueue.main.async {
//                    let navController = UINavigationController()
//                    let newCoordinator = MainCoordinator(navigationController: navController)
//                    newCoordinator.childCoordinators = []
//                    newCoordinator.start()
//                    self.view.window?.rootViewController = navController
//                }
        }).disposed(by: disposeBag)
    }
}
