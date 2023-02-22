//
//  UITableView.swift
//  PrivieLegius
//
//  Created by raul.santos on 26/09/22.
//

import Foundation
import UIKit

extension UITableView {
    func register(cellClass: AnyClass) {
        let classNameString: String = String(describing: cellClass.self)
        register(cellClass.self, forCellReuseIdentifier: classNameString)
    }
    
}
