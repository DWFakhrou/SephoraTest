//
//  ProductListViewModel.swift
//  SephoraTest
//
//  Created by Mon MacBook on 7/23/24.
//

import Foundation

final class ProductListViewModel {
    private var productService: ProductService
    private var productList: [Product] = [] {
        didSet {
            if productList.isEmpty {
                
            } else {
                print(productList)
            }
        }
    }
    
    init(productService: ProductService = ProductService()) {
        self.productService = productService
    }
    
    func getProductList() async throws -> [Product] {
        let endpoint:ProductEndpoint = ProductEndpoint()
        
        do {
            productList = try await productService.perform(endpoint)
        } catch {
            productList = []
        }
        return productList
    }
    
    
}
