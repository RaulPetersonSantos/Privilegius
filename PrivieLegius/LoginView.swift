//
//  LoginView.swift
//  PrivieLegius
//
//  Created by raul.santos on 15/09/22.
//

import Foundation
import SnapKit
import UIKit

class LoginView: BaseView {
    
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
    
    var emailTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Email"
        loginTextField.textColor = UIColor.black
        loginTextField.borderStyle = UITextField.BorderStyle.line

        return loginTextField
    }()
    
    var passwordTextField: UITextField = {
        let senhaTextField = UITextField()
        senhaTextField.placeholder = "Senha"
        senhaTextField.textColor = UIColor.black
        senhaTextField.isSecureTextEntry = true
        senhaTextField.borderStyle = UITextField.BorderStyle.line

        return senhaTextField
    }()
    
    var btnLogar: UIButton = {
        let buttonLogin = UIButton()
        buttonLogin.backgroundColor = .white
        buttonLogin.setTitle("Logar", for: .normal)
        buttonLogin.layer.cornerRadius = 10
        buttonLogin.setTitleColor(.black, for: .normal)
        buttonLogin.layer.cornerRadius = 5
        buttonLogin.layer.borderColor = UIColor.black.cgColor
        buttonLogin.layer.borderWidth = 2
        
        return buttonLogin
    }()
    
    lazy var tapLeave:UITapGestureRecognizer = {
         let tap = UITapGestureRecognizer()

         return tap

     }()
    
    lazy var lbForgotPassword: UILabel = {
        let lb = UILabel()
        lb.text = "Esqueceu a senha"
        lb.textColor = .blue
        lb.isUserInteractionEnabled = true
        lb.addGestureRecognizer(tapLeave)
        return lb
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
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(btnLogar)
        addSubview(lbForgotPassword)
    
        
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
        
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                emailTextField.topAnchor.constraint(equalTo: self.logoText.bottomAnchor, constant: 20),
                emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40 ),
                emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40 ),
        ])
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20),
                passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40 ),
                passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40 ),
        ])
        
        lbForgotPassword.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                lbForgotPassword.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 16),
                lbForgotPassword.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        
        btnLogar.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btnLogar.topAnchor.constraint(equalTo: self.lbForgotPassword.bottomAnchor, constant: 20),
                btnLogar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 90 ),
                btnLogar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -90 ),
        ])
        
     
        
    }

}
