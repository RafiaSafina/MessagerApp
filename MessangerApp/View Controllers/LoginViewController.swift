//
//  ViewController.swift
//  MessangerApp
//
//  Created by Рафия Сафина on 12.12.2022.
//

//import UIKit
//
//class LoginViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//    }
//    
//    private lazy var taskTextFiels: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Add new task"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//    
//    private lazy var saveButton: UIButton = {
//        createButton(
//            withTitle: "Save Task",
//            andColor: .blue,
//            action: UIAction { [unowned self] _ in
//                save()
//        })
//    }()
//    
//    private lazy var cancelButton: UIButton = {
//        createButton(
//            withTitle: "Cancel",
//            andColor: .red,
//            action: UIAction { [unowned self] _ in
//                dismiss(animated: true)
//        })
//    }()
//    
//    
//    private func setupSubview(_ subviews: UIView...) {
//        subviews.forEach { subview in
//            view.addSubview(subview)
//        }
//    }
//    
//    private func setConstraints() {
//        NSLayoutConstraint.activate([
//            taskTextFiels.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
//            taskTextFiels.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
//            taskTextFiels.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
//        ])
//        
//        NSLayoutConstraint.activate([
//            saveButton.topAnchor.constraint(equalTo: taskTextFiels.bottomAnchor, constant: 20),
//            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
//            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
//            ])
//        
//        NSLayoutConstraint.activate([
//            cancelButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
//            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
//            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
//            ])
//    }
//    
//    private func createButton(withTitle title: String, andColor color: UIColor, action: UIAction) -> UIButton {
//        var attrubutes = AttributeContainer()
//        attrubutes.font = UIFont.boldSystemFont(ofSize: 18)
//        
//        var buttonConfiguration = UIButton.Configuration.filled()
//        buttonConfiguration.baseBackgroundColor = color
//        buttonConfiguration.attributedTitle = AttributedString(title, attributes: attrubutes)
//        
//        let button = UIButton(configuration: buttonConfiguration, primaryAction: action)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        
//        return button
//    }
//    
//    private func setupNavigationBar() {
//        title = "To Do List"
//        navigationController?.navigationBar.prefersLargeTitles = true
//        let navBarAppearance  = UINavigationBarAppearance()
//        navBarAppearance.backgroundColor = .systemPink
//        
//        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//        
//        navigationController?.navigationBar.standardAppearance = navBarAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//        navigationController?.navigationBar.tintColor = .white
//    }
//    
//    func save() {
////
//    }
//}
//




