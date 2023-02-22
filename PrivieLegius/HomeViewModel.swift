//
//  HomeViewModel.swift
//  PrivieLegius
//
//  Created by raul.santos on 16/09/22.
//

import UIKit


class HomeViewModel: BaseViewModel {

    func abrirTela(controller: UIViewController){
        let viewModel = LoginViewModel()
        let controllerLogin = LoginViewController(viewModel: viewModel)
        controller.navigationController?.pushViewController(controllerLogin, animated: true)
    }
    
    func showSignUp(controller: UIViewController){
      
    }
    
}

extension HomeViewModel: HomeViewModelProtocol {
    
    func showSignUpForm(controller: UIViewController) {
        showSignUp(controller: controller)
    }
    
    func showLogin(controller: UIViewController) {
        abrirTela(controller: controller)
    }

    
    
}
