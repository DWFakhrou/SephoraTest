//
//  ProductListViewController.swift
//  SephoraTest
//
//  Created by Mon MacBook on 7/23/24.
//

import UIKit

class ProductListViewController: UIViewController {
    var viewModel = ProductListViewModel()
    
    private let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    private var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        Task {
            products = try await viewModel.getProductList()
            tableView.reloadData()
        }
        // Do any additional setup after loading the view.
        self.setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ProductListCell.self, forCellReuseIdentifier: ProductListCell.identifer)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16 ),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16),
        ])
    }
    
    
    
}

extension ProductListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductListCell.identifer, for: indexPath) as? ProductListCell else {
            return UITableViewCell()
        }
        print("\(self.products[indexPath.row].imagesUrl.small)")
        let product = products[indexPath.row]
        cell.configure(name: product.productName, price: product.price, description: product.description, image: UIImage()) // Placeholder image
        
        if let imageUrl = URL(string: product.imagesUrl.small) {
            viewModel.getImage(url: imageUrl) { result in
                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        cell.configure(name: product.productName, price: product.price, description: product.description, image: image)
                    }
                case .failure(let error):
                    print("Failed to fetch image: \(error)")
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    
    
    
    
}


