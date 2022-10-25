//
//  MessageModel.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 18/10/2022.
//

import Foundation

struct Message {
    
    var content: String
    var person: Person? = nil
    
    var fromCurrentUser: Bool {
        /**
         - If the person is nil it's mean the current user is sending the message else if its not nil then we will come to know who is sending the message and it will be the person
         */
        return person == nil
    }
}

extension Message {
    static let exampleMessage = Message(content: "Hello there", person: Person.examplePerson)
    static let exampleSent = Message(content: "Yes I'm here")
}

