//
//  ChatViewModel.swift
//  PrivieLegius
//
//  Created by raul.santos on 18/09/22.
//

import Foundation
import RxCocoa
import RxSwift

class ChatViewModel : BaseViewModel {
    
    var nomeUsuarioSubject = BehaviorSubject<String>(value: "")
    var userDefaults = UserDefaults.standard

}

extension ChatViewModel: ChatViewControllerProtocol {
   
    var nomeDoUsuario: Observable<String> {
        nomeUsuarioSubject.onNext(self.userDefaults.string(forKey: "userNameKey")!)
        return nomeUsuarioSubject.asObservable()
    }
    

    
    
}

