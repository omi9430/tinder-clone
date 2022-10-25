//
//  ChatHeaderView.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 18/10/2022.
//

import SwiftUI

struct ChatHeaderView: View {
    /**
     - Envoirtment Object to check the presentation mode
     - Person Name
     - Image URL for person Image
     - action for the buttons
     */
    
    @Environment(\.presentationMode) var presentationMode
    
    let personName: String
    let imageURL: URL?
    let videoAction: () -> Void
    
    var body: some View {
        
        ZStack{
            
            Color.white
                .edgesIgnoringSafeArea(.top)
                .shadow(radius: 3)
            /**
             - Back Button
             - Image and Name in a VStack
             - Video Button
             */
            
            HStack{
                
                Button {
                    /// Dismiss currentVeiw
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 28, weight: .semibold))
                }
                Spacer()
                
                VStack(spacing: 0){
                    RoundedImage(url: imageURL)
                        .frame(height: 50)
                    Text(personName)
                        .font(.system(size: 14))
                }
                Spacer()

                Button {
                    videoAction()
                } label: {
                    Image(systemName: "video.fill")
                        .font(.system(size: 28, weight: .semibold))
                }

                
                
            }
            .padding()
            
            
        }.frame(height: 50)
    }
}

struct ChatHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ChatHeaderView(personName: "temporary", imageURL: URL(string: "https://picsum.photos/400/300"), videoAction: {})
    }
}
