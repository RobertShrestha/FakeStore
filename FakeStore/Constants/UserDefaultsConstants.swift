//
//  UserDefaultsConstants.swift
//  TingTing
//
//  Created by Aximpro Innovations GmbH on 12/29/20.
//

import Foundation
@propertyWrapper
struct UserDefault<T> {
    let key: String
    var defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
struct UserDefaultsConstants {
    @UserDefault(Constants.UserDefaults.idToken.value, defaultValue: nil)
        static var idToken: String?
    // bookmarkedProducts
    @UserDefault(Constants.UserDefaults.bookmarkedProducts.value, defaultValue: Data())
    static var bookmarkedProducts: Data
}
