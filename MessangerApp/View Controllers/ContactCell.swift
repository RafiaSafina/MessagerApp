//
//  ContactCell.swift
//  MessagerApp
//
//  Created by Рафия Сафина on 22.12.2022.
//

import UIKit

class ContactCell: UITableViewCell {
    
    private let fullName = UILabel()
    private var contactImage = UIImageView() {
        didSet {
            contactImage.layer.cornerRadius = contactImage.frame.size.width / 2
            contactImage.image = UIImage(named: "defaultImage")
        }
    }
    
    override func awakeFromNib() {
            super.awakeFromNib()
        setupSubview(contactImage, fullName)
        setupContentView()
        setConstraints()
        }
    
    func configure(with contact: Contact) {
        fullName.text = contact.fullName
        NetworkManager.shared.fetchImage(from: contact.picture.medium) { result in
            switch result {
            case .success(let imageData):
                self.contactImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
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
        contactImage.translatesAutoresizingMaskIntoConstraints = false
        fullName.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            contactImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            contactImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            contactImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            contactImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            fullName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            fullName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            fullName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            fullName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
    }
}
