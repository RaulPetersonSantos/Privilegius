//
//  LoginViewController.swift
//  PrivieLegius
//
//  Created by raul.santos on 17/12/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxRelay


protocol LoginProtocol {
    
    var validarAcessoObservable: Observable<Bool> { get }
    func acesso(email: String, senha: String)
    func showChat(controller: UIViewController)
    var getUserName: Observable<String> { get }
    var getEmailObservable: Observable<String> { get }
    var getEmailTeste: Observable<String> { get }

}

class LoginViewController: BaseViewController <LoginView> {
    
    var viewModel: LoginProtocol {
        return baseViewModel as! LoginProtocol
    }

    var userDefaults = UserDefaults.standard
    
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
    
    func bind(){
        
        disposeBag = DisposeBag()
        
        self.customView.btnLogar.rx.tap.bind{ [weak self] in
            let email: String = self?.customView.emailTextField.text ?? ""
            let password: String = self?.customView.passwordTextField.text ?? ""
            self?.viewModel.acesso(email: email, senha: password)
        } .disposed(by: disposeBag)
        
        self.viewModel.validarAcessoObservable.subscribe(onNext: { value in
            if(value){
                self.viewModel.showChat(controller: self)
            }
        }) .disposed(by: disposeBag)
        
//        self.viewModel.getUserName.subscribe(onNext: { value in
//            DataBase.shared.userName = value
//        }).disposed(by: disposeBag)
       
//        self.viewModel.getEmailTeste.subscribe(onNext: { value in
//            DataBase.shared.getEmail = value
//        }).disposed(by: disposeBag)

        self.customView.emailTextField.rx.controlEvent(.editingDidEnd).withLatestFrom(self.customView.emailTextField.rx.text.orEmpty).subscribe(onNext: { text in
            print(text)
            DataBase.shared.getUserInfo(with: text, onSucess: {
                print("cai aqui na login controller")
            }, onError: {_ in
                
            })
        }).disposed(by: disposeBag)
          
        self.customView.tapLeave.rx.event.bind(onNext: { _ in
            let model = ForgotPasswordViewModel()
            let controler = ForgotPasswordController(viewModel: model)
            self.navigationController?.pushViewController(controler, animated: false)
        }).disposed(by: disposeBag)
        
        
    }
    
    
}


