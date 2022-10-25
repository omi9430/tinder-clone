//
//  AppStateManager.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 12/10/2022.
//

import Foundation

/**
 - Manages and publish the current state of the app
 */

class AppStateManager: ObservableObject {
    
    @Published var currentState : TabBarButtonType = .fire
}
