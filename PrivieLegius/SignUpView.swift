//
//  SignUpView.swift
//  PrivieLegius
//
//  Created by raul.santos on 22/09/22.
//

import Foundation
import UIKit


class SignUpView: BaseView {
    
    var labelRosa: UIImageView = {
        let labelRosa = UIImageView()
        labelRosa.image = UIImage(named: "LabelRosa")
        return labelRosa
    }()

    var labelAzul: UIImageView = {
        let labelAzul = UIImageView()
        labelAzul.image = UIImage(named: "LabelAzul")
        return labelAzul
    }()
    
    var logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "Logo")
        return logo
    }()
    
    var logoText: UIImageView = {
        let logoText = UIImageView()
        logoText.image = UIImage(named: "LogoTexto")
        return logoText
    }()
    
    var firstNameTextField: UITextField = {
        let firstNameTextField = UITextField()
        firstNameTextField.placeholder = "Primeiro Nome"
        firstNameTextField.textColor = UIColor.black
        firstNameTextField.borderStyle = UITextField.BorderStyle.line

        return firstNameTextField
    }()
    
    var secondNameTextField: UITextField = {
        let secondNameTextField = UITextField()
        secondNameTextField.placeholder = "Segundo Nome"
        secondNameTextField.textColor = UIColor.black
        secondNameTextField.borderStyle = UITextField.BorderStyle.line

        return secondNameTextField
    }()
    
    
    var emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.textColor = UIColor.black
        emailTextField.borderStyle = UITextField.BorderStyle.line

        return emailTextField
    }()
    var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Senha"
        passwordTextField.textColor = UIColor.black
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = UITextField.BorderStyle.line

        return passwordTextField
    }()

    var confirmPasswordTextField: UITextField = {
        let confirmPasswordTextField = UITextField()
        confirmPasswordTextField.placeholder = "Confirmar Senha"
        confirmPasswordTextField.textColor = UIColor.black
        confirmPasswordTextField.isSecureTextEntry = true
        confirmPasswordTextField.borderStyle = UITextField.BorderStyle.line

        return confirmPasswordTextField
    }()
    
    
    var btnCadastrar: UIButton = {
        let buttonLogin = UIButton()
        buttonLogin.backgroundColor = .white
        buttonLogin.setTitle("Cadastro", for: .normal)
        buttonLogin.layer.cornerRadius = 10
        buttonLogin.setTitleColor(.black, for: .normal)
        buttonLogin.layer.cornerRadius = 5
        buttonLogin.layer.borderColor = UIColor.black.cgColor
        buttonLogin.layer.borderWidth = 2
        
        return buttonLogin
    }()
    
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(){
        self.backgroundColor = .white
        addSubview(labelRosa)
        addSubview(labelAzul)
        addSubview(logo)
        addSubview(logoText)
        addSubview(firstNameTextField)
        addSubview(secondNameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(btnCadastrar)

        
        labelRosa.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                labelRosa.topAnchor.constraint(equalTo: self.topAnchor),
                labelRosa.heightAnchor.constraint(equalToConstant: 50),
                labelRosa.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                labelRosa.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])
        
        labelAzul.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
            labelAzul.heightAnchor.constraint(equalToConstant: 50),
            labelAzul.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            labelAzul.leftAnchor.constraint(equalTo: self.leftAnchor),
            labelAzul.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        logo.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                logo.heightAnchor.constraint(equalToConstant: 50),
                logo.widthAnchor.constraint(equalToConstant: 50),
                logo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 55),
                logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 144),
        ])
        
    
        logoText.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                logoText.heightAnchor.constraint(equalToConstant: 42),
                logoText.widthAnchor.constraint(equalToConstant: 139),
                logoText.leadingAnchor.constraint(equalTo: self.logo.trailingAnchor, constant: 14),
                logoText.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
        ])
        
        
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                firstNameTextField.topAnchor.constraint(equalTo: self.logoText.bottomAnchor, constant: 20),
                firstNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40 ),
                firstNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40 ),
        ])
        
        secondNameTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                secondNameTextField.topAnchor.constraint(equalTo: self.firstNameTextField.bottomAnchor, constant: 20),
                secondNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40 ),
                secondNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40 ),
        ])
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                emailTextField.topAnchor.constraint(equalTo: self.secondNameTextField.bottomAnchor, constant: 20),
                emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40 ),
                emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40 ),
        ])
        
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
                passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40 ),
                passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40 ),
        ])
        
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                confirmPasswordTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20),
                confirmPasswordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40 ),
                confirmPasswordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40 ),
        ])
        
        btnCadastrar.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btnCadastrar.topAnchor.constraint(equalTo: self.confirmPasswordTextField.bottomAnchor, constant: 20),
                btnCadastrar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 90 ),
                btnCadastrar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -90 ),
        ])
        
    }

    
}
