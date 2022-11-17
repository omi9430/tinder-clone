//
//  Person.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 18/10/2022.
//

import Foundation

/**
 A person is someone except for the current user people you're messaging with or people you're matching with
 */
struct Person:Hashable,Identifiable {
    let id = UUID().uuidString
    var name: String
    var imageURLs: [URL]
    var bio: String
    var age: Int
    
}

extension Person{
    static let examplePerson = Person(name: "Alex",
                                imageURLs: [URL(string: "https://picsum.photos/400/300")!],
                                      bio:"Its my bio", age: 23)
    static let examplePerson2 = Person(name: "Samantha",
                                imageURLs: [URL(string: "https://picsum.photos/400/301")!],
                                       bio:"I love dogs", age: 24)
    
    static let examplePerson3 = Person(name: "Nikola",
                                imageURLs: [URL(string: "https://picsum.photos/400/302")!],
                                      bio:"Its my bio", age: 43)
    static let examplePerson4 = Person(name: "Thanos",
                                imageURLs: [URL(string: "https://picsum.photos/400/303")!],
                                       bio:"I love dogs", age: 54)
    
    static let examplePerson5 = Person(name: "Thor",
                                imageURLs: [URL(string: "https://picsum.photos/400/304")!],
                                       bio:"I love dogs", age: 34)
    

}
