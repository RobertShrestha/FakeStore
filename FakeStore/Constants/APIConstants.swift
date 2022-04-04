//
//  APIConstants.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/8/20.
//
//https://medium.com/better-programming/implement-the-builder-design-pattern-in-swift-5-ff5bc6f2fc3d
//https://theswiftdev.com/swift-builder-design-pattern/
//https://theswiftdev.com/swift-builder-design-pattern/
import Foundation

class URLBuilder {
    enum Paths:String {
        case login = "auth/login"
        case products = "products"
        var value: String {
            return self.rawValue
        }
    }
    private var components: URLComponents
    init() {
        self.components = URLComponents(url: Environment.rootURL, resolvingAgainstBaseURL: true)!
    }
    func setPath(paths: Paths) -> URLBuilder {
        var path = paths.value
        if !path.hasPrefix("/") {
            path = "/" + path
        }
        self.components.path = path
        return self
    }
    func setIdPath(id: String) -> URLBuilder {
        var path = id
        if !path.hasPrefix("/") {
            path = "/" + path
        }
        let newPath = self.components.path + "/\(id)"
        self.components.path = newPath
        return self
    }

    func build() -> URL? {
        return components.url
    }

}
