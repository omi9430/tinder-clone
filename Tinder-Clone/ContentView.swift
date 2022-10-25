//
//  ContentView.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 12/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var currentAppState: AppStateManager = AppStateManager()
    
    var body: some View {
        CoreView()
            .environmentObject(currentAppState)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
