//
//  ViewController.swift
//  MessangerApp
//
//  Created by Рафия Сафина on 12.12.2022.
//

import UIKit

class LoginViewController: UIViewController {

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Login"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var signupButton: UIButton = {
        createFilledButton(
            withTitle: "SignUp",
            andColor: .systemBlue,
            action: UIAction { [unowned self] _ in
            login()
            }
        )
    }()
    
    private lazy var loginButton: UIButton = {
        createFilledButton(
            withTitle: "Login",
            andColor: .systemBlue,
            action: UIAction { [unowned self] _ in
            login()
            }
        )
    }()
    
    private lazy var showLogin: UIButton = {
        createButton(
            withTitle: "Forgot login?",
            action: UIAction { [unowned self] _ in
                showAlert(withMessage: "Your login is login")
            }
        )
    }()
    
    private lazy var showPassword: UIButton = {
        createButton(
            withTitle: "Forgot password?",
            action: UIAction { [unowned self] _ in
                showAlert(withMessage: "Your password is password")
            }
        )
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubview(
            loginTextField,
            passwordTextField,
            signupButton,
            loginButton,
            showLogin,
            showPassword
        )
        setConstraints()
    }
}

extension LoginViewController {
    
    private func setupSubview(_ subviews: UIView...) {
           subviews.forEach { subview in
               view.addSubview(subview)
           }
    }
    
    private func createFilledButton(withTitle title: String, andColor color: UIColor, action: UIAction) -> UIButton {
            var attrubutes = AttributeContainer()
            attrubutes.font = UIFont.systemFont(ofSize: 18, weight: .light)

            var buttonConfiguration = UIButton.Configuration.filled()
            buttonConfiguration.baseBackgroundColor = color
            buttonConfiguration.attributedTitle = AttributedString(title, attributes: attrubutes)

            let button = UIButton(configuration: buttonConfiguration, primaryAction: action)
            button.translatesAutoresizingMaskIntoConstraints = false

            return button
        }
    
    private func createButton(withTitle title: String, action: UIAction) -> UIButton {
        var attrubutes = AttributeContainer()
        attrubutes.font = UIFont.systemFont(ofSize: 12)

        var buttonConfiguration = UIButton.Configuration.borderless()
        buttonConfiguration.attributedTitle = AttributedString(title, attributes: attrubutes)

        let button = UIButton(configuration: buttonConfiguration, primaryAction: action)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }
            
    private func login() {
        print("")
    }
    
    private func showAlert(withMessage message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(action)
        present(alert, animated: true)
    }
   
    private func setConstraints() {
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
           
        ])
        
        NSLayoutConstraint.activate([
            signupButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            signupButton.trailingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: -40),
            signupButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor, multiplier: 1 / 1 )
            
        ])

        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            showLogin.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            showLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            showLogin.trailingAnchor.constraint(equalTo: showPassword.leadingAnchor, constant: -20),
            showLogin.widthAnchor.constraint(equalTo: showPassword.widthAnchor, multiplier: 1 / 1 )
        ])
        
        NSLayoutConstraint.activate([
            showPassword.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 20),
            showPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

extension LoginViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}


