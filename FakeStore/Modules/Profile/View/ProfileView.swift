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
        }).disposed(by: disposeBag)
    }
}
