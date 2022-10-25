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
struct Person{
    var name: String
    var imageURLs: [URL]
}

extension Person{
    static let examplePerson = Person(name: "Alex", imageURLs: [URL(string: "https://picsum.photos/400/300")!])
}
