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
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "product Name"
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "product Description"
        return view
    }()
    
    private let priceLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "product Price"
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 4
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
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(priceLabel)
        
        
        
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 120),
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
    }
    
    func configure(name: String, price: Double, description: String) {
        self.nameLabel.text = name
        self.descriptionLabel.text = description
        self.priceLabel.text = "\(price)"
    }
    
}
