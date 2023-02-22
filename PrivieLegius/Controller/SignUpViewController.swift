//
//  SignUpViewController.swift
//  PrivieLegius
//
//  Created by raul.santos on 22/09/22.
//

import UIKit
import RxSwift
import RxCocoa

protocol SignUpViewModelProtocol {
    
    func registrar(firstName: String, lastName: String, email: String, senha: String, confirmarSenha: String)
    //func showLogin(controller: UIViewController)
}

class SignUpViewController: BaseViewController <SignUpView>{
    
    var viewModel: SignUpViewModelProtocol {
        return baseViewModel as! SignUpViewModelProtocol
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        
        let backButtonImage = UIImage(named: "back-button")
        if let backButtonImage = backButtonImage {
            addButtonOnNavigationBar(content: .image(image: backButtonImage), position: .left) { [weak self] in
                guard let self = self else { return }
                self.dismiss()
            }
        }
    }

    func dismiss() {
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    func bind() {
        
        disposeBag = DisposeBag()
        self.customView.btnCadastrar.rx.tap.bind { [ weak self ] in
            let email : String = self?.customView.emailTextField.text ?? ""
            let senha : String = self?.customView.passwordTextField.text ?? ""
            let confirmarSenha : String = self?.customView.confirmPasswordTextField.text ?? ""
            let firstName: String = self?.customView.firstNameTextField.text ?? ""
            let lastName: String = self?.customView.secondNameTextField.text ?? ""
            self?.viewModel.registrar(firstName: firstName, lastName: lastName, email: email, senha: senha, confirmarSenha: confirmarSenha)
            //self?.viewModel.showLogin(controller: self!)
         
            let viewModel = LoginViewModel()
            let controllerLogin = LoginViewController(viewModel: viewModel )
            self?.navigationController?.pushViewController(controllerLogin, animated: true)
        } .disposed(by: disposeBag)
        
    }
    
}
