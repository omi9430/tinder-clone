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
struct MessagePreviewModel: Hashable {
    var person: Person
    var lastMessage: String
}

extension MessagePreviewModel {
    
    static let exampleMessagePreview = MessagePreviewModel(person: Person.examplePerson , lastMessage: "Hello Are you there?Hello Are you there?Hello Are you there?Hello Are you there?")
    static let exampleMessagePreview2 = MessagePreviewModel(person: Person.examplePerson2 , lastMessage: "Hello Are you there?")
    
    func filterView(_ searchTxt: String, _ messagePreview: MessagePreviewModel) -> Bool {
        /// Takes in a search text and message preview check if any of them contains a the search text if yes then return true else false
        let person = messagePreview.person
        if person.name.contains(searchTxt) || person.bio.contains(searchTxt) || messagePreview.lastMessage.contains(searchTxt) {
            return true
        }else{
            return false
        }
        
    }
}
