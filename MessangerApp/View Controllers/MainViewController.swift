//
//  UIViewController.swift
//  MessangerApp
//
//  Created by Рафия Сафина on 12.12.2022.
//

import UIKit

class MainViewController: UICollectionViewController {

    private var contact: [Results] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupNavigationBar()
        fetchContacts()
        }
}

// MARK: - Setup View
extension MainViewController {
    private func setupNavigationBar() {
        title = "Chats"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let navBarAppearance  = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .systemBlue
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .white
    }
}

  MARK: - CollectionView Delegate
extension MainViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        contacts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contact", for: indexPath)
        guard let contactCell = cell as? ContactCell else { return UICollectionViewCell() }

        
        
    }

}

// MARK: - Private Methods
extension MainViewController {
    private func fetchContacts() {
        NetworkManager.shared.fetchData(from: Links.url.rawValue) { result in
            switch result {
            case .success(let contact):
                self.contact = contact
                self.collectionView.reloadData()
                print(contacts)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
   

