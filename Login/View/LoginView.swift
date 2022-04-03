//  
//  LoginView.swift
//  
//
//  Created by Robert Shrestha on 4/3/22.
//

import UIKit

class LoginView: UIViewController {

    // OUTLETS HERE

    // VARIABLES HERE
    var viewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
    }
    fileprivate func setupViewModel() {
    }
}
