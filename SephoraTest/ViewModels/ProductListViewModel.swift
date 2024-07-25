//
//  ProductListViewModel.swift
//  SephoraTest
//
//  Created by Mon MacBook on 7/23/24.
//

import Foundation
import UIKit

final class ProductListViewModel {
    private var productService: ProductService
    private var productList: [Product] = [] {
        didSet {
            if productList.isEmpty {
                
            } else {
                
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
    
    func getImage(url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
            Task {
                do {
                    let image = try await productService.perform(from: url)
                    completion(.success(image))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    
    
}
