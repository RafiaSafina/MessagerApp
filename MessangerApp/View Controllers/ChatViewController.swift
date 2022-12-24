//
//  ChatViewController.swift
//  MessagerApp
//
//  Created by Рафия Сафина on 24.12.2022.
//

import UIKit

class ChatViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.rowHeight = 100
        tableView.register(MessageCell.self, forCellReuseIdentifier: Constants.cellID.rawValue)
    }

    // MARK: - TableviewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
}
