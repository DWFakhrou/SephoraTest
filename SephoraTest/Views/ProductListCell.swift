//
//  ProductListCellTableViewCell.swift
//  SephoraTest
//
//  Created by Mon MacBook on 7/24/24.
//

import UIKit

class ProductListCell: UITableViewCell {
    
    static var identifer: String {
        String(describing: ProductListCell.self )
    }
    
    private var productImage: UIImageView = {
        let view = UIImageView(image: UIImage())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "product Name"
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.numberOfLines = 2
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "product Description"
        view.font = .systemFont(ofSize: 14)
        view.numberOfLines = 3
        return view
    }()
    
    private let priceLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .systemFont(ofSize: 18, weight: .bold)
        view.text = "product Price"
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        view.alignment = .leading
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.contentView.addSubview(productImage)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(priceLabel)
        
        
        
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 300),
            productImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            productImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            productImage.heightAnchor.constraint(equalToConstant: 120),
            productImage.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            
        ])
    }
    
    func configure(name: String, price: Double, description: String, image: UIImage) {
        self.nameLabel.text = name
        self.descriptionLabel.text = description
        self.priceLabel.text = "\(price) $"
        self.productImage.image = image
    }
    
}
