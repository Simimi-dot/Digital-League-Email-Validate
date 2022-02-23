//
//  ViewController.swift
//  Email Validate
//
//  Created by Егор Астахов on 23.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Name validate properties
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        return view
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя..."
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var validateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Валидировать", for: .normal)
        button.setTitle("Не дави на меня", for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTypeValidateNameButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var validateNameResultLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидаю валидации имени"
        return label
    }()
    
    // MARK: - Email validate properties
    
    private lazy var emailValidateCardView: UIView = {
        var emailCardView = UIView()
        emailCardView.translatesAutoresizingMaskIntoConstraints = false
        emailCardView.backgroundColor = .brown
        emailCardView.layer.cornerRadius = 12
        return emailCardView
    }()
    
    private lazy var emailValidateTextField: UITextField = {
        var emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Введите email..."
        emailTextField.borderStyle = .roundedRect
        emailTextField.backgroundColor = .systemBackground
        return emailTextField
    }()
    
    private lazy var emailValidateButton: UIButton = {
        var emailButton = UIButton()
        emailButton.translatesAutoresizingMaskIntoConstraints = false
        emailButton.setTitle("Валидировать", for: .normal)
        emailButton.setTitle("Спасибо что надавил на меня", for: .highlighted)
        emailButton.backgroundColor = .systemBlue
        emailButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        emailButton.setTitleColor(.white, for: .normal)
        emailButton.layer.cornerRadius = 4
        emailButton.addTarget(self, action: #selector(didTypeValidateEmailButton), for: .touchUpInside)
        return emailButton
    }()
    
    private lazy var emailValidateResultLabel: UILabel = {
        var emailValidateLabel = UILabel()
        emailValidateLabel.translatesAutoresizingMaskIntoConstraints = false
        emailValidateLabel.text = "Ожидаю валидации почты"
        return emailValidateLabel
    }()
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
}

// MARK: - Extension

extension ViewController {
    private func configureView() {
        view.backgroundColor = .gray
        
        view.addSubview(cardView)
        cardView.addSubview(nameTextField)
        cardView.addSubview(validateButton)
        cardView.addSubview(validateNameResultLabel)
        
        view.addSubview(emailValidateCardView)
        emailValidateCardView.addSubview(emailValidateTextField)
        emailValidateCardView.addSubview(emailValidateButton)
        emailValidateCardView.addSubview(emailValidateResultLabel)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            validateButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            validateButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            validateButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            
            validateNameResultLabel.topAnchor.constraint(equalTo: validateButton.bottomAnchor, constant: 16),
            validateNameResultLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            validateNameResultLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            validateNameResultLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16),
            
            emailValidateCardView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 50),
            emailValidateCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailValidateCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            emailValidateTextField.topAnchor.constraint(equalTo: emailValidateCardView.topAnchor, constant: 16),
            emailValidateTextField.leadingAnchor.constraint(equalTo: emailValidateCardView.leadingAnchor, constant: 16),
            emailValidateTextField.trailingAnchor.constraint(equalTo: emailValidateCardView.trailingAnchor, constant: -16),
            
            emailValidateButton.topAnchor.constraint(equalTo: emailValidateTextField.bottomAnchor, constant: 16),
            emailValidateButton.leadingAnchor.constraint(equalTo: emailValidateCardView.leadingAnchor, constant: 16),
            emailValidateButton.trailingAnchor.constraint(equalTo: emailValidateCardView.trailingAnchor, constant: -16),
            
            emailValidateResultLabel.topAnchor.constraint(equalTo: emailValidateButton.bottomAnchor, constant: 16),
            emailValidateResultLabel.leadingAnchor.constraint(equalTo: emailValidateCardView.leadingAnchor, constant: 16),
            emailValidateResultLabel.trailingAnchor.constraint(equalTo: emailValidateCardView.trailingAnchor, constant: -16),
            emailValidateResultLabel.bottomAnchor.constraint(equalTo: emailValidateCardView.bottomAnchor, constant: -16)
        ])
    }
    
    @objc
    private func didTypeValidateNameButton() {
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: nameTextField.text)
        
        validateNameResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        validateNameResultLabel.textColor = isValid ? .systemGreen : .systemRed
    }
    
    @objc
    private func didTypeValidateEmailButton() {
        let regExString = "([a-z0-9!#$%&'*+-/=?^_`{|}~]){1,64}@([a-z0-9!#$%&'*+-/=?^_`{|}~]){1,64}\\.([a-z0-9]){2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: emailValidateTextField.text)
        
        emailValidateResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        emailValidateResultLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}

