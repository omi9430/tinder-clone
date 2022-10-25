//
//  MessagePreview.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 18/10/2022.
//

import Foundation

/**
 - This will help us to preview the message under the message tab
 */
struct MessagePreview {
    var person: Person
    var lastMessage: String
}

extension MessagePreview {
    
    static let exampleMessagePreview = MessagePreview(person: Person.examplePerson , lastMessage: "Hello Are you there?")
}
