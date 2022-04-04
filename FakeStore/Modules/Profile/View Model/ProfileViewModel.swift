//  
//  ProfileViewModel.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation

class ProfileViewModel {
    // MARK: - Variables declaration
    weak var viewType: ProfileViewProtocol?

    private let service: ProfileServiceProtocol

    private var model: [ProfileModel] = [ProfileModel]() {
        didSet {
            self.count = self.model.count
        }
    }

    /// Count your data in model
    var count: Int = 0

    // MARK: - Network checking

    /// Define networkStatus for check network connection
    var networkStatus = Reach().connectionStatus()

    /// Define boolean for internet status, call when network disconnected
    var isDisconnected: Bool = false {
        didSet {
            self.viewType?.alert(message: Constants.noInternetConnection)
        }
    }
    // MARK: - Initialization Method
    init(withProfile serviceProtocol: ProfileServiceProtocol = ProfileService() ) {
        self.service = serviceProtocol

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.networkStatusChanged(_:)),
                                               name: NSNotification
                                                .Name(rawValue: ReachabilityStatusChangedNotification),
                                               object: nil)
        Reach().monitorReachabilityChanges()

    }

    // MARK: Internet monitor status
    @objc func networkStatusChanged(_ notification: Notification) {
        self.networkStatus = Reach().connectionStatus()
    }

    // MARK: - Example Func
    func exampleBind() {
        switch networkStatus {
        case .offline:
            self.isDisconnected = true
        case .online: break
            // call your service here
        default:
            break
        }
    }
}

extension ProfileViewModel {

}
