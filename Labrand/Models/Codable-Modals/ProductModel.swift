//
//  ProductModel.swift
//  Labrand
//
//  Created by Shakhzod on 03/10/22.
//


import Foundation
import UIKit

struct ProductModel: Codable {
    var title: String!
    var branName: String!
    var productImage: String!
    var isFavourite: Bool!
    var price: Int!
    var rate: Int!
    var rateCount: Double!
    var salePrice: Int!
    var color: String = ""
    var size: String = ""
    var bagCount: Int = 0
    
    var isHaveSale: Bool {
        return salePrice != 0 && salePrice != nil
    }
}

struct CategoryModel {
    var name: String?
    var image: UIImage?
    
    init(name: String? , image: UIImage? ) {
        self.name = name
        self.image = image
    }
}

class MockData {
    
    static let instance = MockData()
    private init(){}
    
    
    private let product = ProductModel(
        title: "Evening Dress",
        branName: "Dorothy Perkins",
        productImage: "product_img",
        isFavourite: false,
        price: 15,
        rate: 5,
        rateCount: 2,
        salePrice: 12
    )
    
    
    lazy var products: [ProductModel] = [
        ProductModel(
            title: "Evening Dress1",
            branName: "Dorothy Perkins",
            productImage: "product_img",
            isFavourite: true,
            price: 15,
            rate: 5,
            rateCount: 3.5,
            salePrice: 0
        ),
        product,
        product,
        product,
        product,
        product,
        product,
        product,
        product,
        product
    ]
    
    lazy var productsForCard: [ProductModel] = [
        product,
        product,
        product,
        product,
        product
    ]
    
    let shopCategories: [CategoryModel] = [
        CategoryModel(name: "New", image: UIImage(named: "cat2")),
        CategoryModel(name: "Clothes", image: UIImage(named: "cat3")),
        CategoryModel(name: "Shoes", image: UIImage(named: "cat0")),
        CategoryModel(name: "Accesories", image: UIImage(named: "cat1")) ]
    
}
