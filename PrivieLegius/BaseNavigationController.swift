//
//  BaseNavigationController.swift
//  PrivieLegius
//
//  Created by raul.santos on 19/12/22.
//
import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transparentNavigation()
        replaceBackButton()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override open var shouldAutorotate: Bool {
        if let visibleVC = visibleViewController {
            return visibleVC.shouldAutorotate
        }
        return super.shouldAutorotate
    }
    
    override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        if let visibleVC = visibleViewController {
            return visibleVC.preferredInterfaceOrientationForPresentation
        }
        return super.preferredInterfaceOrientationForPresentation
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if let visibleVC = visibleViewController {
            return visibleVC.supportedInterfaceOrientations
        }
        return super.supportedInterfaceOrientations
    }
    
    open func pushViewControllerFromRoot(_ viewController: UIViewController) {
        self.setViewControllers([self.viewControllers[0], viewController], animated: true)
    }
    
    private func transparentNavigation() {
        let boldAttribute: [NSAttributedString.Key : Any] = [
            .foregroundColor: UIColor.white
        ]
        
        navigationBar.titleTextAttributes = boldAttribute
        view.backgroundColor = .clear
    }
    
    private func replaceBackButton() {
        navigationBar.tintColor = .white
    }
}
