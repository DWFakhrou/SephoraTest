//
//  ProductEndpoint.swift
//  SephoraTest
//
//  Created by Mon MacBook on 7/23/24.
//

import Foundation

struct ProductEndpoint: Endpoint {
    var path: String {
        APIConstants.productPath
    }
    
    var httpMethod: HttpMethod {
        return .GET
    }
}

extension APIConstants {
    static let productPath = "/items.json"
    
}
