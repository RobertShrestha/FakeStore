//
//  Environment.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//

import Foundation

public enum Environment {

    enum BuildState {
        case debug
        case staging
        case release
    }

    private static let production: BuildState = {
        #if DEBUG
        print("DEBUG")
        return .debug
        #elseif STAGING
        print("STAGING")
        return .staging
        #else
        print("RELEASE")
        return .release
        #endif
    }()

    static func buildState() -> BuildState {
        return self.production
    }

    enum Keys {
        // swiftlint:disable nesting
        enum Plist {
            static let rootURL = "ROOT_URL"
            static let apiKey = "API_KEY"
        }
    }

    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()

    static let rootURL: URL = {
        guard let rootURLstring = Environment.infoDictionary[Keys.Plist.rootURL] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            fatalError("Root URL is invalid")
        }
        return url
    }()
    static let newsAPIKey: String = {
        guard let apiKey = Environment.infoDictionary[Keys.Plist.apiKey] as? String else {
            fatalError("GOOGLE API KEY not set in plist for this environment")
        }
        return apiKey
    }()

    //  static let apiKey: String = {
    //    guard let apiKey = Environment.infoDictionary["API_KEY"] as? String else {
    //      fatalError("API Key not set in plist for this environment")
    //    }
    //    return apiKey
    //  }()
}
