//
//  Constants.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 12/29/20.
//

import Foundation
import Kingfisher
// swiftlint:disable line_length file_length


// Validation Error enum
enum ValidationRegistrationSetupError {
    case username
    case password
}


struct Constants {
    enum UserDefaults: String {
        case idToken
        case bookmarkedProducts
        var value: String {
            return self.rawValue
        }
    }
    static let noInternetConnection = "No network connection. Please connect to the internet.".localized()
    static let parsingError = "Something went wrong when parsing the data.".localized()
    static let cancel = "Cancel".localized()
    static let labelSkip = "Skip for now"
    static let back = "Back"
    static let labelOk = "Ok"
    static let perPage = 20
}

struct TableErrorMessages {
    enum NoProducts: String {
        case title = "No Products Found"
        case message = "Please try again later"
        var value: String {
            return self.rawValue.localized()
        }
    }
}
