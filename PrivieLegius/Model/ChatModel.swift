//
//  ChatModel.swift
//  PrivieLegius
//
//  Created by raul.santos on 26/09/22.
//

import Foundation


struct ChatModel {
    
    let profileName: String
    let profileIcon: String
    let lastMessage: String
    let lastSeen: String
    
    init(profileName: String, profileIcon: String ,lastMessage: String, lastSeen: String) {
        self.profileName = profileName
        self.profileIcon = profileIcon
        self.lastMessage = lastMessage
        self.lastSeen = lastSeen
    }
    
    
}
