//
//  ContactCell.swift
//  MessagerApp
//
//  Created by Рафия Сафина on 22.12.2022.
//

import UIKit

class ContactCell: UICollectionViewCell {
    
    private let fullName = UILabel()
    private var image = UIImageView() {
        didSet {
            image.layer.cornerRadius = image.frame.size.width / 2
        }
    }
    
    override func awakeFromNib() {
            super.awakeFromNib()
        setupSubview(image, fullName)
        setupContentView()
        setConstraints()
        }
    
    func configure(with contact: Contact) {
        fullName.text = contact.results.
    }
}

// MARK: - Private Methods
extension ContactCell {
    
    private func setupSubview(_ subviews: UIView...) {
           subviews.forEach { subview in
               contentView.addSubview(subview)
           }
    }
        
        
    private func setupContentView() {
        contentView.backgroundColor  = .white
        image.translatesAutoresizingMaskIntoConstraints = false
        fullName.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            fullName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            fullName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            fullName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            fullName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
    }
}
