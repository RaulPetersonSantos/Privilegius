//
//  LoginViewModel.swift
//  PrivieLegius
//
//  Created by raul.santos on 16/09/22.
//

import Firebase
import UIKit
import RxCocoa
import RxSwift

class LoginViewModel: BaseViewModel {

    private var checkSubject: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var getEmailSubject:BehaviorRelay<String> = BehaviorRelay(value: "")
    var getNomeSubject:BehaviorRelay<String> = BehaviorRelay(value: "")
    var getUserNameSubject = BehaviorSubject<String>(value: "")
    var userDefaults = UserDefaults.standard
    var getEmailTesteSubject = BehaviorSubject<String>(value: "")
    
    func acessar(email: String, senha: String){
        Auth.auth().signIn(withEmail: email, password: senha) { [weak self] authResult, error in
            if let e = error {
                print (e)

            } else {
                
                self?.checkSubject.accept(true)
                self?.getEmailSubject.accept(email)

                print("deu bom")
            
            }
        }
        
    }
        
    func abrirChat(controller: UIViewController){
        let viewModel = ChatViewModel()
        let controllerChat = ChatViewController(viewModel: viewModel )
        controller.navigationController?.pushViewController(controllerChat, animated: true)
    }
    
}

extension LoginViewModel: LoginProtocol {
  
    

    func showChat(controller: UIViewController) {
        abrirChat(controller: controller)
    }
    
    var getEmailObservable: Observable<String> {
        return self.getEmailSubject.asObservable()
    }

    var getNomeObservable: Observable<String> {
        return getNomeSubject.asObservable()
    }

    var validarAcessoObservable: Observable<Bool> {
        return checkSubject.asObservable()
    }

    func acesso(email: String, senha: String) {
        self.acessar(email: email, senha: senha)
    }

    var getUserName: Observable<String> {
        getUserNameSubject.onNext(self.userDefaults.string(forKey: "userNameKey")!)
        return getUserNameSubject.asObservable()
    }
    
    var getEmailTeste: Observable<String> {
        getEmailTesteSubject.onNext(self.userDefaults.string(forKey: "userEmailKey")!)
        return getEmailTesteSubject.asObserver()
    }
}
