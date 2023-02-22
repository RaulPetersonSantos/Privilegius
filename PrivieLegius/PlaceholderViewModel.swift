//
//  PlaceholderViewModel.swift
//  PrivieLegius
//
//  Created by raul.santos on 15/09/22.
//

import Foundation
import UIKit

enum MessageViewStateType {
    case simpleMessage(message: String)
    case actionMessage(message: String, buttonTitle: String, buttonImage: UIImage?)
}

struct PlaceholderViewModel {
    
    /// A message response to display on view
    var errorMessage: String
    /// Action button title string
    var buttonTitle: String?
    /// Action button image to display inside button on the left side of the text
    var buttonImage: UIImage?
    /// Action callback method to handle any action or make an api call again
    var action: (() -> ())

    ///
    /// This `ViewModel` is responsible for bind info in the screen error state.
    ///
    /// ```
    /// let errorViewModel = PlaceholderViewModel(state: .emptyOrder) { [weak self] in
    ///     print("Make an API request")
    /// }
    /// ```
    ///
    /// - parameters:
    ///   - stateType: Type of message, used to display different information according to it
    ///   - buttonTitle: Action button title string, if nil we used a default error title
    ///   - buttonImage: Action button image to display inside button on the left side of the text, as optional if not implemented action button will be build without image
    ///   - action: Action callback method to handle any action or make an api request again
    
    init(stateType: MessageViewStateType, action: @escaping (() -> ())) {
        
        self.action = action
        
        switch stateType {
            
        case .simpleMessage(let errorMessageString):
            
            errorMessage = errorMessageString
            
        case .actionMessage(let errorMessageString, let buttonTitleString, let buttonImageIcon):
            
            errorMessage = errorMessageString
            
            buttonTitle = buttonTitleString
            
            buttonImage = buttonImageIcon
        }
    }
}
