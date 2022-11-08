//
//  ChatManager.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 18/10/2022.
//

import Foundation
import Combine
import UIKit


class ChatManager: ObservableObject {
    @Published var messages: [Message] = []
    @Published var isKeyboardShowing = false
    
    var cancellable : AnyCancellable? = nil
    private var person: Person
    
    init(person: Person){
        self.person = person
        loadMessages()
        setUpKeyboardPublisher()
    }
    
    private let keyBoardWillShow = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map({ _ in true})
    
               
    private let keyBoardwillHide = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map({ _ in false})
    /// Send message
    func sendMessage(message: Message) {
        ///Create network call to send message to database
        messages.append(message)
    }
    
    func loadMessages(){
        /// Load messages from the network
        
        messages = [Message.exampleMessage,Message.exampleSent]
        
    }
    
    
    private func setUpKeyboardPublisher(){
        
        cancellable = Publishers.Merge(keyBoardWillShow, keyBoardwillHide)
            .subscribe(on: DispatchQueue.main)
            .assign(to: \.isKeyboardShowing , on: self)
        
    }
    
    deinit {
        /// When the class deinit we will cancel the publishers
        cancellable?.cancel()
    }
}

