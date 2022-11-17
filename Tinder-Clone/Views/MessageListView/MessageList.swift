//
//  MessageList.swift
//  Tinder-Clone
//
//  Created by omair khan on 08/11/2022.
//

import SwiftUI

struct MessageList: View {
    @ObservedObject var messagesListVM = MessagesListVm()
    @State private var searchText: String = ""  /// This will store the search textfield text
    @State private var isEditing: Bool = false /// This will check if textfield is editing
    
   
    var body: some View {
        VStack{
            ///Search text field
            HStack {
                TextField("Search", text: $searchText)
                    .padding(8)
                    .padding(.horizontal,25)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(8)
                    .padding(1)
                    .overlay {
                        /// Add a magniifying glass icon on search bar textfield
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 20,weight: .bold))
                                .foregroundColor(Color.gray)
                                .padding(2)
                            
                            Spacer()
                        }
                }//Overlay
                    .onTapGesture {
                        isEditing = true
                    }
                    .animation(.easeIn(duration: 0.25))
                
                if isEditing {
                    /// Cancel button show only if textfield is editing
                    Button {
                        /**
                         - Clear Search Text
                         - set isEditing false
                         - hide the keyboard by resigning first responder
                         */
                        //TODO: Erase auto correct text
                        searchText = ""
                        isEditing = false
                        hideKeyboard()
                    } label: {
                        Text("cancel")
                            .padding(.trailing,5)
                    }//Button
                    .transition(.move(edge: .trailing))
                    .animation(.easeIn(duration: 0.25))
                }//if condition
            }//Hstack
           
            Spacer().frame(height: 15)
            // Add the Message RowView
            // If search text is empty then show all the rows else show the filtered one
            ZStack {
                VStack {
                    ForEach(messagesListVM.messagesPreview.filter({searchText.isEmpty ? true:checkFilter($0)}), id: \.self){ preview in
                        NavigationLink(destination: ChatView(person: preview.person)) {
                            MessageRowView(messagePreview: preview)
                            
                        }
                        .animation(.easeIn(duration: 0.25))
                        .transition(.slide)
                        
                    }
                }//VStack for Message Previews
                
                
                
            }.overlay {
                // add an overlay when user start to search
                if isEditing && searchText.isEmpty{
                    Color.white.opacity(0.5)
                }
                
            } //ZStack
            
            
            Spacer()

        }//VStack
        .modifier(HideNavigationBar())
        
    }
    
    
    func checkFilter(_ preview: MessagePreviewModel) -> Bool{
        preview.filterView(searchText, preview)
    }
        
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            MessageList()
        }
    }
}
