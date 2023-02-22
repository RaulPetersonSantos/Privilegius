//
//  HomeView.swift
//  PrivieLegius
//
//  Created by raul.santos on 16/09/22.
//

import Foundation
import UIKit
import SnapKit
import AVFoundation
import AVKit

class HomeView: BaseView {
    
    
    var labelRosa: UIImageView = {
        let labelRosa = UIImageView()
        labelRosa.image = UIImage(named: "LabelRosa")
        return labelRosa
    }()
    
    var logoText: UIImageView = {
        let logoText = UIImageView()
        logoText.image = UIImage(named: "LogoTexto")
        return logoText
    }()
    
    var logo: UIImageView = {
        let lg = UIImageView()
        lg.image = UIImage(named: "Logo")
        return lg
    }()
    
//    var load: UIImageView = {
//        let lg = UIImageView()
//        
//        return lg
//    }()
    
    var btnLogin: UIButton = {
        let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.backgroundColor = UIColor.white
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 2
        return btn
    }()
    
    var btnCadastro: UIButton = {
        let btn = UIButton()
        btn.setTitle("Cadastro", for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.backgroundColor = UIColor.white
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 5
        btn.layer.borderColor = UIColor.black.cgColor
        btn.layer.borderWidth = 2
        return btn
    }()
    
    
    var labelAzul: UIImageView = {
        let labelAzul = UIImageView()
        labelAzul.image = UIImage(named: "LabelAzul")
        return labelAzul
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.setup()
    
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        self.backgroundColor = .white
        
        self.addSubview(labelRosa)
        self.addSubview(logoText)
        self.addSubview(logo)
        self.addSubview(btnLogin)
        self.addSubview(btnCadastro)
        self.addSubview(labelAzul)
//        self.addSubview(load)
        
//        load.snp.makeConstraints {
//            $0.leading.top.trailing.bottom.equalToSuperview()
//        }
        
        labelRosa.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                labelRosa.topAnchor.constraint(equalTo: self.topAnchor),
                labelRosa.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                labelRosa.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                labelRosa.heightAnchor.constraint(equalToConstant: 74),
        ])
        
        logoText.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                logoText.topAnchor.constraint(equalTo: self.labelRosa.bottomAnchor, constant: 146),
                logoText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -32),
        ])
        
        
        logo.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                logo.centerYAnchor.constraint(equalTo: logoText.centerYAnchor),
                logo.heightAnchor.constraint(equalToConstant: 88),
                logo.widthAnchor.constraint(equalToConstant: 88),
                logo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
                logo.trailingAnchor.constraint(equalTo: self.logoText.leadingAnchor, constant: -14)
        ])

        btnLogin.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btnLogin.heightAnchor.constraint(equalToConstant: 40),
                btnLogin.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
                btnLogin.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
                btnLogin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                btnLogin.topAnchor.constraint(equalTo: self.logo.bottomAnchor, constant: 60)
        ])
        
        
        btnCadastro.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                btnCadastro.topAnchor.constraint(equalTo: self.btnLogin.bottomAnchor, constant: 14),
                btnCadastro.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                btnCadastro.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
                btnCadastro.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
                btnCadastro.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        labelAzul.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                labelAzul.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                labelAzul.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                labelAzul.rightAnchor.constraint(equalTo: self.rightAnchor),
                labelAzul.heightAnchor.constraint(equalToConstant: 60)
        ])

    }
    
}
