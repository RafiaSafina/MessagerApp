//
//  UIViewController.swift
//  MessangerApp
//
//  Created by Рафия Сафина on 12.12.2022.
//

import UIKit

class MainViewController: UITableViewController, UIApplicationDelegate {

    private var contacts: Information?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        tableView.rowHeight = 100
        tableView.register(ContactCell.self, forCellReuseIdentifier: Constants.contactCellID.rawValue)

        setupNavigationBar()
        fetchContacts(with: Links.url2.rawValue)
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

//  MARK: - TableView DataSource
extension MainViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts?.results.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.contactCellID.rawValue, for: indexPath)
       
        guard let cell = cell as? ContactCell else { return UITableViewCell() }
        
        guard let content = contacts?.results[indexPath.row] else { return UITableViewCell() }
        cell.configure(with: content)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let chatVC = ChatViewController()
        chatVC.title = contacts?.results[indexPath.row].fullName
        chatVC.contacts = contacts
        navigationController?.pushViewController(chatVC, animated: true)
    }
}

// MARK: - Private Methods
extension MainViewController {
    private func fetchContacts(with url: String) {
        NetworkManager.shared.fetchData(from: url) { [weak self] result in
            switch result {
            case .success(let contacts):
                self?.contacts = contacts
                self?.tableView.reloadData()
                print(contacts)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
   

