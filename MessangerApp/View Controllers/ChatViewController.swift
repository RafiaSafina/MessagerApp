//
//  ChatViewController.swift
//  MessagerApp
//
//  Created by Рафия Сафина on 24.12.2022.
//

import UIKit

class ChatViewController: UITableViewController {

    var contacts: Information!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.rowHeight = 70
        tableView.register(ChatCell.self, forCellReuseIdentifier: Constants.chatCellID.rawValue)
    }

    // MARK: - TableviewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.chatCellID.rawValue, for: indexPath)
        
        guard let cell = cell as? ChatCell else { return UITableViewCell() }
        let content = contacts.results[indexPath.row]
        cell.configure(with: content)
        
        return cell
    }
}
