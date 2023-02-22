//
//  SignUpModel.swift
//  PrivieLegius
//
//  Created by raul.santos on 22/09/22.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import Firebase

class SignUpViewModel: BaseViewModel {
    
    func registrar( firstName: String, lastName: String,email: String, senha: String, confirmarSenha: String){
        Auth.auth().createUser(withEmail: email, password: senha) { authResult, error in
            if let e = error {
                print (e)
            } else {
                print("Cadastro realizado!")
                DataBase.shared.insertUser(with: ChatAppUser(firstName: firstName, lastName: lastName, emailAddress: email, password: senha))
//                DataBase.shared.getUserInfo(with: email) {
//                    print("Pegando email \(email)")
//                } onError: { error in
//                    print("deu erro ao pegar o email")
//                }

            }
            
        }
    }
    
    func abrirTelaLogin(controller: UIViewController){
        let viewModel = LoginViewModel()
        let controllerLogin = LoginViewController(viewModel: viewModel )
        controller.navigationController?.pushViewController(controllerLogin, animated: true)
    }
    
}

extension SignUpViewModel: SignUpViewModelProtocol {
    
    func showLogin(controller: UIViewController)  {
        abrirTelaLogin(controller: controller)
    }
    
    
}
