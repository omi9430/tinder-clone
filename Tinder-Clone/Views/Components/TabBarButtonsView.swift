//
//  TabBarButtonsView.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 12/10/2022.
//

import SwiftUI

enum TabBarButtonType: String{
    case fire = "flame.fill"
    case star = "star.fill"
    case message = "message.fill"
    case profile = "person.fill"
}

struct TabBarButtonsView: View {
    
    @EnvironmentObject var appStateManager : AppStateManager
  //  var btnAction: () -> Void
    var type: TabBarButtonType
    
    var body: some View {
        Button {
            /// Call the function assigned to btnAction
            appStateManager.currentState = type
        } label: {
            Image(systemName: type.rawValue)
                .resizable()
                .scaledToFit()
                .if(appStateManager.currentState == type, transform: { view in
                    view.foregroundColor(type == .star ? .yellow:.red)
                })
                .foregroundColor(Color.gray.opacity(0.5))
        }//button
        .frame(height: 32)

    }
    
}

struct TabBarButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButtonsView(type: .fire)
    }
}
