//
//  Localized.swift
//  PrivieLegius
//
//  Created by raul.santos on 03/11/22.
//

import Foundation

final class Localized {
    static var bundle: Bundle {
        Bundle(for: Localized.self)
    }
   
}

extension Localized {
    static private var table: String { "Privilegius" }
    
    
    static var resetPassword: String {
        return NSLocalizedString("resetPassword", tableName: table, bundle: bundle, comment: "")
    }
    
    static var wrongEmail: String {
        return NSLocalizedString("wrongEmail", tableName: table, bundle: bundle, comment: "")
    }
    
    static var emptyField: String {
        return NSLocalizedString("emptyField", tableName: table, bundle: bundle, comment: "")
    }
    
}
