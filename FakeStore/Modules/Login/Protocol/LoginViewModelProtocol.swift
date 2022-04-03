//  
//  LoginViewModelProtocol.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation
import RxSwift
import RxCocoa
protocol LoginViewModelProtocol {
    var username: BehaviorRelay<String> { get set }
    var password: BehaviorRelay<String> { get set }
    var loginButtonTapped: PublishSubject<Void> { get set }
    var validationError: PublishSubject<ValidationRegistrationSetupError> { get set }
    var goToDashboard: PublishSubject<Void> {get set}
}
