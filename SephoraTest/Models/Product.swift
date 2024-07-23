//
//  Product.swift
//  SephoraTest
//
//  Created by Mon MacBook on 7/23/24.
//

import Foundation




struct Product: Codable {
    enum Codingkeys: String, CodingKey {
        case id = "product_id"
        case name = "product_name"
        case description
        case price
        case image = "images_url"
        case brand = "c_brand"
        case isSpecial = "is_special_brand"
        case isProductSet = "is_productSet"
    }
    let productId: Int
    let productName: String
    let description: String
    let price: Double
    let imagesUrl: ImageType
    let cBrand: BrandType
    let isProductSet: Bool
    let isSpecialBrand: Bool
}

struct ImageType: Codable {
    let small: String
    let large: String
}

struct BrandType: Codable {
    let id: String
    let name: String
}


