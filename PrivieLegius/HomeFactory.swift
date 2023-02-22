//
//  HomeCoordinator.swift
//  PrivieLegius
//
//  Created by raul.santos on 19/12/22.
//

import Foundation
import UIKit

 class HomeFactory: NSObject {
    
    class func build(coordinator: MainCoordinator) -> ChatViewController {
        
        let model = ChatViewModel()
        return ChatViewController(viewModel: model)
        
    }
    
}
