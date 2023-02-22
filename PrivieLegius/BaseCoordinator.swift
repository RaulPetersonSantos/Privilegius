//
//  BaseCoordinator.swift
//  PrivieLegius
//
//  Created by raul.santos on 19/12/22.
//

import Foundation
import UIKit

protocol BaseCoordinatorCallbackProtocol: AnyObject {
    func shouldDismissCoordinator()
    func shouldDismissCoordinatorWith(message: String)
}

protocol CoordinatorProtocol: AnyObject {
    func start() -> UIViewController
    func start(navigationController: BaseNavigationController)
}

extension CoordinatorProtocol {
    
    func start(navigationController: BaseNavigationController) {
        fatalError("The coordinator needs implement this method")
    }
}

class BaseCoordinator: NSObject {
    
    weak var callback: BaseCoordinatorCallbackProtocol?
    
    var childCoordinator: CoordinatorProtocol?
    var actionSheetViewController: UIViewController?
    
    internal func dismissActionSheetIfNeeded(action: @escaping (() -> Void)) {
        if let actionSheetViewController = actionSheetViewController {
            actionSheetViewController.dismiss(animated: true) {
                self.actionSheetViewController = nil
                self.childCoordinator = nil
                action()
            }
        } else {
            action()
        }
    }
    
    func shouldDismissCoordinatorWith(message: String) {
        fatalError("this coordinator should be BaseNavigableCoordinator")
    }
    
    func dismissActionSheetWith(message: String) {
        fatalError("this coordinator should be BaseNavigableCoordinator")
    }
}

class BaseNavigableCoordinator: BaseCoordinator {
    
    internal var navigationController = BaseNavigationController()
    
    init(callback: BaseCoordinatorCallbackProtocol? = nil) {
        super.init()
        self.callback = callback
        
        navigationController.modalPresentationStyle = .fullScreen
    }
    
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func popWith(message: String) {
        navigationController.popViewController(animated: true)
        if let vc = navigationController.viewControllers.last as? BaseViewController {

        }
    }
    
    func dismiss() {
        navigationController.dismiss(animated: true) {
            self.callback?.shouldDismissCoordinator()
        }
    }
    
    
    func dismissWith(message: String) {
        navigationController.dismiss(animated: true) {
            self.callback?.shouldDismissCoordinatorWith(message: message)
        }
    }
    
    override func shouldDismissCoordinatorWith(message: String) {
        childCoordinator = nil
        
        if let vc = navigationController.viewControllers.last as? BaseViewController {
            //vc.showMessage(message: message)
        }
    }
    
    override func dismissActionSheetWith(message: String) {
        dismissActionSheetIfNeeded {[unowned self] in
            self.shouldDismissCoordinatorWith(message: message)
        }
    }
    
}
