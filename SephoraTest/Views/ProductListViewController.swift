//
//  ProductListViewController.swift
//  SephoraTest
//
//  Created by Mon MacBook on 7/23/24.
//

import UIKit

class ProductListViewController: UIViewController {
    var viewModel = ProductListViewModel()
    
    func getProductList() async throws -> [Product] {
        try await viewModel.getProductList()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            try await getProductList()
        }
        // Do any additional setup after loading the view.
    }
}
