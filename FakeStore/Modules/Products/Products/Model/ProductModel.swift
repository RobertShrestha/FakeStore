//  
//  ProductsModel.swift
//  FakeStore
//
//  Created by Robert Shrestha on 4/3/22.
//

import Foundation

struct ProductModel: Codable {
        let id: Int?
        let title: String?
        let price: Double?
        let welcomeDescription: String?
        let category: Category?
        let image: String?
        let rating: Rating?

        enum CodingKeys: String, CodingKey {
            case id, title, price
            case welcomeDescription = "description"
            case category, image, rating
        }
    }

    enum Category: String, Codable, CaseIterable {
        case electronics = "electronics"
        case jewelery = "jewelery"
        case menSClothing = "men's clothing"
        case womenSClothing = "women's clothing"
        case none = "none"
    }

    // MARK: - Rating
    struct Rating: Codable {
        let rate: Double?
        let count: Int?
    }
struct ProductFilters {
    var minValue: Double = 0
    var maxValue: Double = 0
    var category: Category = .none
    var rating: Double = 0.0
}
