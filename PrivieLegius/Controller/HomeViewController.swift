//
//  HomeViewController.swift
//  PrivieLegius
//
//  Created by raul.santos on 16/09/22.
//

import UIKit
import RxSwift
import RxCocoa
import Firebase


protocol HomeViewModelProtocol {
    
    func showLogin(controller: UIViewController)
    func showSignUpForm(controller: UIViewController)
}

class HomeViewController: BaseViewController <HomeView> {
   
    var viewModel: HomeViewModelProtocol {
        return baseViewModel as! HomeViewModelProtocol
    }

    var mainCoord: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        mainCoord = MainCoordinator()
        self.navigationController?.isNavigationBarHidden = true
//        let loadingGif = UIImage.gifImageWithName("gifLoading")
//        self.customView.load.image = loadingGif
      
    }
    
    func bind() {
        disposeBag = DisposeBag()
        
        self.customView.btnLogin.rx.tap.bind { [ weak self ] in
            let viewModel = LoginViewModel()
            let controllerLogin = LoginViewController(viewModel: viewModel)
            self?.navigationController?.pushViewController(controllerLogin, animated: false)
    
        }.disposed(by: disposeBag)
        
        self.customView.btnCadastro.rx.tap.bind { [weak self] in
            let viewModel = SignUpViewModel()
            let contronllerSignUp = SignUpViewController(viewModel: viewModel)
            self?.navigationController?.pushViewController(contronllerSignUp, animated: false)
        }.disposed(by: disposeBag)
        
    }
    
}
