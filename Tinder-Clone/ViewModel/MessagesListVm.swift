//
//  MessagesListVm.swift
//  Tinder-Clone
//
//  Created by omair khan on 08/11/2022.
//

import Foundation

class MessagesListVm: ObservableObject {
    
    @Published var messages: [MessagePreview] = []
    
    init() {
        loadMessage()
    }
    
    func loadMessage(){
        /// This will load messages list from the server
        self.messages =  [MessagePreview.exampleMessagePreview]
    }
    
}
