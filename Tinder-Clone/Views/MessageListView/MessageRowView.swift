//
//  MessageRowView.swift
//  Tinder-Clone
//
//  Created by omair khan on 08/11/2022.
//
import KingfisherSwiftUI
import SwiftUI

struct MessageRowView: View {
    var messagePreview: MessagePreviewModel
    var body: some View {
        HStack{
            
            RoundedImage(url: messagePreview.person.imageURLs.first)
                .frame(height: 90)
            
            
            VStack(alignment:.leading,spacing: 8){
                Text(messagePreview.person.name)
                    .font(.system(size: 21,weight: .semibold))
                   
                Text(messagePreview.lastMessage)
                    .foregroundColor(Color.primaryText)
                    .lineLimit(1)
                    
            }//Vstack
            
            Spacer()
        }//Hstack
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView(messagePreview: MessagePreviewModel.exampleMessagePreview)
    }
}
