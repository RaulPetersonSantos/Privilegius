//
//  ForgotPasswordController.swift
//  PrivieLegius
//
//  Created by raul.santos on 30/10/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol ForgotPasswordViewModelProtocol {
    
    func verifyEmail(email: String)
    var clickVericatedObserver: Observable<Bool> { get }
    var clickNotVericatedObserver: Observable<Bool> { get }
    var vericatedIsEmptyObserver: Observable<Bool> { get }
}

class ForgotPasswordController: BaseViewController <ForgotPasswordView> {
    
    var viewModel: ForgotPasswordViewModelProtocol {
        return baseViewModel as! ForgotPasswordViewModelProtocol
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
        
        self.customView.btnConfirm.rx.tap.bind { [ weak self ] in
            let getEmail : String = self?.customView.emailField.text ?? ""
            self?.viewModel.verifyEmail(email: getEmail)
        } .disposed(by: disposeBag)
        
        self.viewModel.clickVericatedObserver.subscribe(onNext: { value in
            if value {
                let alert = BaseViewController.createAlertController(title: "Por favor", message: Localized.resetPassword)
                self.present(alert, animated: true, completion: nil)
            }
        }) .disposed(by: disposeBag)
        
        self.viewModel.clickNotVericatedObserver.subscribe(onNext: { value in
            if value {
                let alert = BaseViewController.createAlertController(title: "Ops", message: Localized.wrongEmail)
                self.present(alert, animated: true, completion: nil)
            }
        }) .disposed(by: disposeBag)
        
        self.viewModel.vericatedIsEmptyObserver.subscribe(onNext: { value in
            if value {
                let alert = BaseViewController.createAlertController(title: "Ops", message: Localized.emptyField)
                self.present(alert, animated: true, completion: nil)
            }
        }) .disposed(by: disposeBag)

    }
    
    
}
