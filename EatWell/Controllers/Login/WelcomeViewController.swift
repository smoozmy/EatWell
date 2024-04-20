//
//  ViewController.swift
//  EatWell
//
//  Created by Александр Крапивин on 08.04.2024.
//

import UIKit

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - UI and Lyfe Cycle
    
    private lazy var mainStacView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 100
        element.alignment = .center
        element.distribution = .fill
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var buttonstacView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 20
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var helloLabel: UILabel = {
        let element = UILabel()
        element.text = "EatWell"
        element.font = UIFont(name: "YSDisplay-Bold", size: 50)
        element.textColor = .darkColor
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var registrationButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Зарегистрироваться", for: .normal)
                element.titleLabel?.font = UIFont(name: "YSDisplay-Medium", size: 24)
                element.tintColor = .accentColor
                element.layer.cornerRadius = 15
        element.layer.borderWidth = 2
        element.layer.borderColor = UIColor.accentColor.cgColor
                element.backgroundColor = .grayColor
                element.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var loginButton: UIButton = {
        let element = UIButton(type: .system)
        element.setTitle("Войти", for: .normal)
                element.titleLabel?.font = UIFont(name: "YSDisplay-Medium", size: 24)
                element.tintColor = .white
                element.layer.cornerRadius = 15
                element.backgroundColor = .accentColor
                element.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .grayColor
        
        setView()
        setupConstraints()
    }
    private func setView() {
        view.addSubview(mainStacView)
        mainStacView.addArrangedSubview(helloLabel)
        mainStacView.addArrangedSubview(buttonstacView)
        buttonstacView.addArrangedSubview(registrationButton)
        buttonstacView.addArrangedSubview(loginButton)
    }
    
    
    // MARK: - Actions

    @objc private func registrationButtonTapped() {
        print("registration")
        
        let registrationViewController = RegistrationViewController()
        
        let navigationController = UINavigationController(rootViewController: registrationViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
        
    }

    @objc private func loginButtonTapped() {
        print("login")
        
        let loginViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        present(navigationController, animated: true, completion: nil)
    }

}


// MARK: - Constraints

extension WelcomeViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStacView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStacView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStacView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            buttonstacView.leadingAnchor.constraint(equalTo: mainStacView.leadingAnchor),
            buttonstacView.trailingAnchor.constraint(equalTo: mainStacView.trailingAnchor),
            
            registrationButton.heightAnchor.constraint(equalToConstant: 55),
            loginButton.heightAnchor.constraint(equalToConstant: 55),
            
            
            
        ])
    }
}

