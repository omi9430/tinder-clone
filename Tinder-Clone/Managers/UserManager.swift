//
//  UserManager.swift
//  Tinder-Clone
//
//  Created by omair khan on 10/11/2022.
//

import Foundation

class UserManager: ObservableObject{
    @Published var currentUser: UserModel = UserModel(name: " ", age: 0, jobTitle: "")
    @Published var matches: [Person] = []
    @Published var topPicks: [Person] = []
    
    init(){
        loadUser()
        ///With network call you cannot call load matches here because you need to have a user first before you get matches
        loadMatches()
        topPicksForUser()
    }
    
    
    func loadUser(){
        ///Make any network calls for loading the  user
        currentUser = UserModel.exampleUser
        
    }
    
    func loadMatches(){
        self.matches = [Person.examplePerson,Person.examplePerson2,Person.examplePerson3,Person.examplePerson4,Person.examplePerson5]
    }
    
    func topPicksForUser(){
        self.topPicks = [Person.examplePerson2,Person.examplePerson3,Person.examplePerson,Person.examplePerson5,Person.examplePerson4]
    }
    
    
}
