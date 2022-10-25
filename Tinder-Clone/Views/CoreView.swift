//
//  CoreView.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 12/10/2022.
//

import SwiftUI

struct CoreView: View {
    /**
     - This class needs to know the state of the app since the state variable is stored in global envoirnment hence we create an EnvoirnmentObejct
     - A function which will display the current selected View
     */
        
    @EnvironmentObject var appState: AppStateManager
    
    func currentView() -> some View {
        /// This function displays the selected View
        switch appState.currentState{
            
        case .fire:
            let view = Text("Fire")
            return AnyView(view)
        case .star:
            let view = Text("Star")
            return AnyView(view)
        case .message:
            let view = Text("Message")
            return AnyView(view)
        case .profile:
            let view = ProfileView()
            return AnyView(view)
        }
    }
    
    var body: some View {
        ZStack{
            
            Color(.systemGray6)
                .opacity(0.35)
                .edgesIgnoringSafeArea(.vertical)
          
           
            VStack{
                /**
                 - Create buttons for the tab bar in the HStack
                 - Space them up equally
                 */
                
                /// This Group hold all the buttons
                Group{
                 //   Spacer().frame(height: 0)
                    HStack{
                        Spacer()
                        //Flame
                        TabBarButtonsView( type: .fire)
                        Spacer()
                        // Star Btn
                        TabBarButtonsView(type: .star)
                        Spacer()
                        // message Btn
                        TabBarButtonsView( type: .message)
                        Spacer()
                        // Profile
                        TabBarButtonsView(type: .profile)
                                        
                    Spacer()
                    }//HStack
                    .frame(height: 100)
                }
                
             
                
                    //Add the current view on screen
                currentView()
                
                Spacer()
                
            }//VStack
            
        }
        
            
    }
}

struct CoreView_Previews: PreviewProvider {
    static var previews: some View {
        CoreView()
            .previewDevice("iPhone 12 Pro")
            .environmentObject(AppStateManager())
    }
}
