//
//  ContactCell.swift
//  MessagerApp
//
//  Created by Рафия Сафина on 22.12.2022.
//

import UIKit

class ContactCell: UITableViewCell {
    
    private let fullNameLabel = UILabel()
    private let contactImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview(contactImageView, fullNameLabel)
        
        configureFullNameLabel()
        configureContactImageView()
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with contact: Contact) {
        fullNameLabel.text = contact.fullName
        NetworkManager.shared.fetchImage(from: contact.picture.medium) { result in
            switch result {
            case .success(let imageData):
                self.contactImageView.image = UIImage(data: imageData)
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
    
    private func configureFullNameLabel() {
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.numberOfLines = 0
        fullNameLabel.textColor = .black
        fullNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func configureContactImageView() {
        contactImageView.translatesAutoresizingMaskIntoConstraints = false
        contactImageView.layer.cornerRadius = contactImageView.frame.size.width / 2
        contactImageView.clipsToBounds = true
        contactImageView.image = UIImage(named: Constants.defaultImage.rawValue)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            contactImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            contactImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            contactImageView.heightAnchor.constraint(equalToConstant: 80),
            contactImageView.widthAnchor.constraint(equalTo: contactImageView.heightAnchor, multiplier: 1/1)
        ])
        
        NSLayoutConstraint.activate([
            fullNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            fullNameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 20),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 80),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
}

