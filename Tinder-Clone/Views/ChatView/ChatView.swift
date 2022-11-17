//
//  ChatView.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 18/10/2022.
//

import SwiftUI

struct ChatView: View {
    
    @ObservedObject var chatManager: ChatManager
    @State private var messageTyping: String = ""
    @State private var proxyScroller: ScrollViewProxy? = nil
    
    private var person: Person
    
    init(person: Person){
        self.person = person
        self.chatManager = ChatManager(person: person)
    }
    var body: some View {
        
        ZStack(alignment: .top) {
            
            
            
            ChatHeaderView(personName: person.name, imageURL: person.imageURLs.first) {
                
                ///TODO: Video Action
            }
            
            
            VStack{
                Spacer().frame(height: 80)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    ScrollViewReader { proxy in
                        LazyVStack{
                            /// Get all the messages from chat manager with the index of array so you can adjust the position of Textfield according to last message
                            ForEach(chatManager.messages.indices, id: \.self) { index in
                                
                                let msg = chatManager.messages[index]
                                
                                ChatMessageView(message: msg)
                                    .id(index)
                            }
                        }//LazyVStack
                        .onAppear {
                            proxyScroller = proxy
                        }

                    }//ScrollViewReader
                })//ScrollView
                
                ZStack(alignment: .trailing){
                    HStack{
                        
                        TextField("Send a message", text: $messageTyping)
                            .textFieldStyle(PlainTextFieldStyle())
                            .frame(height: 45)
                            .padding(.horizontal)
                            
                            
                        
                        /// Button to send the message
                        Button {
                            ///Because the message is sent from us so we do not add the person
                            chatManager.sendMessage(message: Message(content: messageTyping))
                            messageTyping = ""
                            scrollToBottom()
                           
                        } label: {
                            Text("Send")
                        }
                        .padding()
                        .foregroundColor(messageTyping.isEmpty ? .gray : .blue)
                        .disabled(messageTyping.isEmpty ? true : false)
                    }
                   

                        
                    
                }// ZStack for Textfield
                .frame(height: 45)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.gray.opacity(35), lineWidth: 1)
                )
                .padding(.horizontal)
                .padding(.bottom)
               
                
               

            }//VStack
   
        }//ZStack
        .modifier(HideNavigationBar())
        .onChange(of: chatManager.isKeyboardShowing, perform: {value in
            if value {
                scrollToBottom()
            }
        })
        
      
    }//body
    
    //MARK: function to Scroll chat messages
    func scrollToBottom(){
        let count = chatManager.messages.count - 1
        proxyScroller?.scrollTo(count, anchor: .bottom)
    }
    
  
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.examplePerson)
    }
}
