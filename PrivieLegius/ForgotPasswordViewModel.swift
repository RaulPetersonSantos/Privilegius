//
//  ForgotPasswordViewModel.swift
//  PrivieLegius
//
//  Created by raul.santos on 30/10/22.
//

import Foundation
import Firebase
import RxCocoa
import RxSwift
import FirebaseAuth

class ForgotPasswordViewModel: BaseViewModel {
    
    private let verificarEmail: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private let isEmptyRelay: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private let clickVericatedRelay: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private let clickNotVericatedRelay: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    private func verificarEmail(email: String){
        guard !email.isEmpty else {
            print("email e senha não pode estar vazios")
            self.isEmptyRelay.accept(true)
            return
        }
        DataBase.shared.userExists(with: email) {[weak self]  existe in
            guard !existe else {
                FirebaseAuth.Auth.auth().sendPasswordReset(withEmail: email){ error in
                    if let error = error {
                        print("Houve um erro")
                    }
                    self?.clickVericatedRelay.accept(true)
                    print("email enviado")
                }
                return
            }
            self?.clickNotVericatedRelay.accept(true)
            print("email não consta no BD")
        }
    }
}


extension ForgotPasswordViewModel: ForgotPasswordViewModelProtocol {
    
    func verifyEmail(email: String) {
        self.verificarEmail(email: email)
    }
    var clickVericatedObserver: Observable<Bool> {
        self.clickVericatedRelay.asObservable()
    }
    var clickNotVericatedObserver: Observable<Bool> {
        self.clickNotVericatedRelay.asObservable()
    }
    var vericatedIsEmptyObserver: Observable<Bool> {
        self.isEmptyRelay.asObservable()
    }
    
    
}
