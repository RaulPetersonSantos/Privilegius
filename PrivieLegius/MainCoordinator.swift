//
//  MainCoordinator.swift
//  PrivieLegius
//
//  Created by raul.santos on 19/12/22.
//
import Foundation
import UIKit

protocol ChatProtocol {
    
    func popWithDefaultNavigation()
    
}

class MainCoordinator: BaseNavigableCoordinator, CoordinatorProtocol  {
    
    
     func start() -> UIViewController {
         showChat()
         //homeController()
        return navigationController
    }
    
    func comecou() {
        //let model = ChatViewModel()
        //let controllerInicial = ChatViewController(viewModel: model)
        //navigationController.setViewControllers([controllerInicial], animated: true)
    }
    
    func homeController() {
        let controller = HomeFactory.build(coordinator: self)
        navigationController.setViewControllers([controller], animated: false)
    }
    
    func showChat() {
        let model = ChatViewModel()
        let controller = ChatViewController(viewModel: model)
        //navigationController.setViewControllers([controller], animated: true)
        print("total de controler \(navigationController.viewControllers.count)")
        navigationController.pushViewController(controller, animated: true)
    }
    
}
