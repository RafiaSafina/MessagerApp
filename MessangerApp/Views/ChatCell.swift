//
//  MessageCell.swift
//  MessagerApp
//
//  Created by Рафия Сафина on 24.12.2022.
//

import UIKit

class ChatCell: UITableViewCell {

    private let rightImageView = UIImageView()
    private let leftImageView = UIImageView()
    private let messageLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubview(rightImageView, leftImageView, messageLabel)
        
        setupLeftImageView()
        setupRightImageView()
        setupMessageLabel()
        
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with contact: Contact) {
        rightImageView.image = UIImage(named: Constants.defaultImage.rawValue)
        NetworkManager.shared.fetchImage(from: contact.picture.thumbnail) { result in
            switch result {
            case .success(let imageData):
                self.leftImageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - Private Methods
extension ChatCell {
    private func setupSubview(_ subviews: UIView...) {
           subviews.forEach { subview in
               contentView.addSubview(subview)
           }
    }
    
    private func setupLeftImageView() {
        leftImageView.translatesAutoresizingMaskIntoConstraints = false
        leftImageView.layer.cornerRadius = leftImageView.frame.height / 2
        leftImageView.image = UIImage(named: Constants.defaultImage.rawValue)
        leftImageView.clipsToBounds = true
    }
    
    private func setupRightImageView() {
        rightImageView.translatesAutoresizingMaskIntoConstraints = false
        rightImageView.layer.cornerRadius = rightImageView.frame.height / 2
        rightImageView.image = UIImage(named: Constants.defaultImage.rawValue)
        rightImageView.clipsToBounds = true
    }
    
    
    private func setupMessageLabel() {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        messageLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            leftImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            leftImageView.heightAnchor.constraint(equalToConstant: 80),
            leftImageView.widthAnchor.constraint(equalTo: leftImageView.heightAnchor, multiplier: 1 / 1)
        ])
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 15),
            messageLabel.heightAnchor.constraint(equalToConstant: 80),
            messageLabel.trailingAnchor.constraint(equalTo: rightImageView.leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            rightImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightImageView.heightAnchor.constraint(equalToConstant: 80),
            rightImageView.widthAnchor.constraint(equalTo: rightImageView.heightAnchor, multiplier: 1 / 1),
            rightImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
}
