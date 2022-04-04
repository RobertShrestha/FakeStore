//  
//  LoginViewModel.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation
import RxSwift
import RxCocoa
class LoginViewModel: LoginViewModelProtocol {
    // MARK: - Variables declaration
    weak var viewType: LoginViewProtocol?

    private let service: LoginServiceProtocol

    private var model: [LoginModel] = [LoginModel]() {
        didSet {
            self.count = self.model.count
        }
    }

    /// Count your data in model
    var count: Int = 0

    var username = BehaviorRelay<String>(value: "johnd")
    var password = BehaviorRelay<String>(value: "m38rmF$")
    var loginButtonTapped = PublishSubject<Void>()
    var validationError = PublishSubject<ValidationRegistrationSetupError>()
    var goToDashboard = PublishSubject<Void>()
    var disposeBag = DisposeBag()

    // MARK: - Network checking
    /// Define networkStatus for check network connection
    var networkStatus = Reach().connectionStatus()

    /// Define boolean for internet status, call when network disconnected
    var isDisconnected: Bool = false {
        didSet {
            self.viewType?.alert(message: Constants.noInternetConnection)
        }
    }
    var isValid: Observable<Bool> {
        return Observable.combineLatest(username.asObservable(),
                                        password.asObservable()) { (username, password) in
            return (!username.isEmpty && !password.isEmpty)
        }
    }



    // MARK: - Initialization Method
    init(withLogin serviceProtocol: LoginServiceProtocol = LoginService() ) {
        self.service = serviceProtocol

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.networkStatusChanged(_:)),
                                               name: NSNotification
                                                .Name(rawValue: ReachabilityStatusChangedNotification),
                                               object: nil)
        Reach().monitorReachabilityChanges()
        bindings()

    }

    // view and viewmodel bindings
    func bindings() {
        self.loginButtonTapped.subscribe(onNext: {
            self.validate()
        }).disposed(by: disposeBag)
    }


    /// validation function for the fields
    func validate() {
        if username.value.isEmpty {
            self.validationError.onNext(.username)
        }
        if password.value.isEmpty {
            self.validationError.onNext(.password)
        }
        if !username.value.isEmpty && !password.value.isEmpty {
           doLogin()
        }
    }

    // MARK: Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }

    // MARK: - Example Func
    func doLogin() {
        switch networkStatus {
        case .offline:
            self.isDisconnected = true
        case .online:
            guard let url = URLBuilder()
                    .setPath(paths: .login)
                    .build() else { return }
            let request = RequestLoginModel(username: self.username.value, password: self.password.value)

            var resource = Resource<LoginModel>(url: url)
            resource.body =  request.toData()
            resource.httpMethod = .post
            let response = self.service.doLogin(resource: resource)
            viewType?.showProgressHud()
            _  = response.subscribe(onSuccess: { model in
                print(model)
                UserDefaultsConstants.idToken = model.token
                #warning("Remove this")
                print("the tokne is", UserDefaultsConstants.idToken)
                self.goToDashboard.onNext(())
                self.viewType?.hideProgressHud()
            }, onFailure: { error in
                print(error)
                let error = error as? APIErrors
                switch error {
                case .seralizationError:
                    self.viewType?.alert(message: "Invalid username or password", title: nil, okAction: nil)
                case .apiError(let message):
                    self.viewType?.alert(message: message, title: nil, okAction: nil)
                case .domainError(let error):
                    self.viewType?.alert(message: error.localizedDescription, title: nil, okAction: nil)
                case .none:
                    log.error("APIErrors not found")
                }
                self.viewType?.hideProgressHud()
            })
        default:
            break
        }
    }
}

extension LoginViewModel {

}
