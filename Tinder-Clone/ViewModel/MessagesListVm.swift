//
//  MessagesListVm.swift
//  Tinder-Clone
//
//  Created by omair khan on 08/11/2022.
//

import Foundation

class MessagesListVm: ObservableObject {
    
    @Published var messagesPreview: [MessagePreviewModel] = []
    
    init() {
        loadMessage()
    }
    
    func loadMessage(){
        /// This will load messages list from the server
        self.messagesPreview =  [MessagePreviewModel.exampleMessagePreview, MessagePreviewModel.exampleMessagePreview2]
    }
    
    
    
}
