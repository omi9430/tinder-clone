//
//  ContentView.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 12/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var currentAppState: AppStateManager = AppStateManager()
    @ObservedObject var userManager: UserManager = UserManager()
    
    var body: some View {
        CoreView()
            .environmentObject(currentAppState)
            .environmentObject(userManager)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
