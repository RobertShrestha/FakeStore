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
    enum QueryItems: String {
        case apiKey = "apiKey"
        case country = "country"
        case sources = "sources"
        case category = "category"
        case categories = "categories"
        case query = "q"
        case pageSize = "pageSize"
        case page = "page"
        var value: String {
            return self.rawValue
        }
    }

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

    func addCountry(withCountryCode code:String) -> URLBuilder {
        if self.components.queryItems == nil {
            self.components.queryItems = []
        }
        self.components.queryItems?.append(URLQueryItem(name: Self.QueryItems.country.value, value: code))
        return self
    }

    func addSource(with source:String) -> URLBuilder {
        if self.components.queryItems == nil {
            self.components.queryItems = []
        }
        self.components.queryItems?.append(URLQueryItem(name: Self.QueryItems.sources.value, value: source))
        return self
    }
    func addCategory(with category:String) -> URLBuilder {
        if self.components.queryItems == nil {
            self.components.queryItems = []
        }
        self.components.queryItems?.append(URLQueryItem(name: Self.QueryItems.category.value, value: category))
        return self
    }

    func addQuery(with query:String) -> URLBuilder {
        if self.components.queryItems == nil {
            self.components.queryItems = []
        }
        self.components.queryItems?.append(URLQueryItem(name: Self.QueryItems.query.value, value: query))
        return self
    }
    func addPageSize(withSize size: Int) -> URLBuilder {
        if self.components.queryItems == nil {
            self.components.queryItems = []
        }
        self.components.queryItems?.append(URLQueryItem(name: Self.QueryItems.pageSize.value, value: String(size)))
        return self
    }
    func addPageCount(withPage page:Int) -> URLBuilder {
        if self.components.queryItems == nil {
            self.components.queryItems = []
        }
        self.components.queryItems?.append(URLQueryItem(name: Self.QueryItems.page.value, value: String(page)))
        return self
    }

    func addAPIKey() -> URLBuilder {
        if self.components.queryItems == nil {
            self.components.queryItems = []
        }
        self.components.queryItems?.append(URLQueryItem(name: Self.QueryItems.apiKey.value, value: Environment.newsAPIKey))
        return self
    }

    func build() -> URL? {
        return components.url
    }

}
