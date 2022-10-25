//
//  SwiftUIView.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 17/10/2022.
//

import SwiftUI

struct ChatMessageView: View {
    var message: Message
    var body: some View {
        
        HStack{
            
            if !message.fromCurrentUser{
               Spacer()
            }
            
            Text(message.content)
                .padding(5)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .background(message.fromCurrentUser ? .gray : .blue)
                .cornerRadius(5)
            
            if message.fromCurrentUser{
                Spacer()
            }
            
        }
        .padding()
    
}
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageView(message: Message.exampleSent)
                            .previewDevice("iPhone 12 Pro")
    }
}
