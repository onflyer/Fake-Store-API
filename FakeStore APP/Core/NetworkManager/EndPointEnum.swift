//
//  Endpoint.swift
//  FakeStore APP
//
//  Created by Aleksandar Milidrag on 1/16/24.
//

import Foundation

enum EndPointEnum: String, CaseIterable {
    case All
    case Jewelery
    case Electronics
    case MensClothing
    case WomansClothing
  
    
    var path: String {
        switch self {
        case .All:
            return "https://fakestoreapi.com/products"
        case .Jewelery:
            return "https://fakestoreapi.com/products/category/jewelery"
        case .Electronics:
            return "https://fakestoreapi.com/products/category/electronics"
        case .MensClothing:
            return "https://fakestoreapi.com/products/category/men's clothing"
        case .WomansClothing:
            return "https://fakestoreapi.com/products/category/women's clothing"
       
        }
    }
}


struct Endpoint {
    
    private static let baseUrl = "https://api.escuelajs.co/api/v1"
    
    struct Urls {
        static let getAllProducts = URL(string: "\(baseUrl)/products")!
        static func getSingleProduct(productId: Int) -> URL {
            return URL(string: "\(baseUrl)/products/\(productId)")!
        }
        static let createProduct = URL(string: "\(baseUrl)/products")!
        static func updateProduct(productId: Int) -> URL {
            return URL(string: "\(baseUrl)/products/\(productId)")!
        }
        static func deleteProduct(productId: Int) -> URL {
            return URL(string: "\(baseUrl)/products/\(productId)")!
        }
        
        //MARK: [GET] https://api.escuelajs.co/api/v1/products/?title=Generic
        static let filterByTitle = URL(string: "\(baseUrl)/products/")!
        
        //MARK: [GET] https://api.escuelajs.co/api/v1/products/price=100
        static let filterByPrice = URL(string: "\(baseUrl)/products/")!
        
        //MARK: [GET] https://api.escuelajs.co/api/v1/products/?price_min=900&price_max=1000
        static let filterByMinAndMaxPrice = URL(string: "\(baseUrl)/products/")!
        
        //MARK: [GET] https://api.escuelajs.co/api/v1/products/?categoryId=1
        static let productsByCategory = URL(string: "\(baseUrl)/categories/")!
        
        static let getAllCategories = URL(string: "\(baseUrl)/categories")!
        
        static func getSingleProduct(categoryId: Int) -> URL {
            return URL(string: "\(baseUrl)/categories/\(categoryId)")!
        }
        
        static let createCategory = URL(string: "\(baseUrl)/categories/")!
        
        static func updateCategory(categoryId: Int) -> URL {
            return URL(string: "\(baseUrl)/categories/\(categoryId)")!
        }
        static func deleteCategory(categoryId: Int) -> URL {
            return URL(string: "\(baseUrl)/categories/\(categoryId)")!
        }
        
        static func getAllProductsByCategory(categoryId: Int) -> URL {
            return URL(string: "\(baseUrl)/categories/\(categoryId)/products")!
        }
        
        static let getAllUsers = URL(string: "\(baseUrl)/users")!
        
        static func getSingleUser(userId: Int) -> URL {
            return URL(string: "\(baseUrl)/users/\(userId)")!
        }
        
        static let createUser = URL(string: "\(baseUrl)/users/")!
        
        static func updateUser(userId: Int) -> URL {
            return URL(string: "\(baseUrl)/users/\(userId)")!
        }
        
        static let checkTheEmail = URL(string: "\(baseUrl)/users/is-available")!
        
        static let login = URL(string: "\(baseUrl)/auth/login")!
        
        static let loginWithAccessToken = URL(string: "\(baseUrl)/auth/profile")!
        
        static let refreshAccessTokenWithRefreshToken = URL(string: "\(baseUrl)/auth/refresh-token")!
    }
    
        
}
