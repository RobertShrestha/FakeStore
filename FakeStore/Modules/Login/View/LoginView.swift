//  
//  LoginView.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import UIKit
import RxSwift
import RxCocoa
class LoginView: UIViewController, Storyboarded,LoginViewProtocol {

    // OUTLETS HERE

    @IBOutlet var loginButton: OutlineButton!
    @IBOutlet var passwordTextField: InputTextField!
    @IBOutlet var usernameTextField: InputTextField!
    // VARIABLES HERE
    weak var coordinator: MainCoordinator?
    var viewModel: LoginViewModelProtocol?
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()

        self.passwordTextField.text = "m38rmF$"
        self.usernameTextField.text = "johnd"
    }
    fileprivate func setupViewModel() {
        guard let viewModel = viewModel else {
            return
        }
        self.usernameTextField
            .rx
            .text
            .orEmpty
            .bind(to: viewModel.username)
            .disposed(by: disposeBag)
        self.passwordTextField
            .rx
            .text
            .orEmpty
            .bind(to: viewModel.password)
            .disposed(by: disposeBag)
        self.loginButton
            .rx
            .tap
            .bind(to: viewModel.loginButtonTapped)
            .disposed(by: disposeBag)

        viewModel.validationError.subscribe(onNext: {
            switch $0 {
            case .username:
                self.alert(message: "Username not valid")
            case .password:
                self.alert(message: "Password not valid")
            }
        }).disposed(by: disposeBag)
        viewModel.goToDashboard.subscribe ( onNext: {
            self.coordinator?.goToDashboard()
        }).disposed(by: disposeBag)
    }
}
