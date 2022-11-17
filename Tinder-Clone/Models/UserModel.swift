//
//  UserModel.swift
//  Tinder-Clone
//
//  Created by omair khan on 10/11/2022.
//

import Foundation

struct  UserModel {
    let name:String
    let age: Int
    let jobTitle: String
    var imageUrls: [URL] = []
    var profileTip: String = ""
    var isGoldSubsccriber: Bool = true
}

extension UserModel {
    static let exampleUser = UserModel(name: "Alex",
                                age: 27,
                                jobTitle: "IOS Developer",
                                imageUrls: [URL(string: "https://picsum.photos/400")!],
                                profileTip: "Photo Tip: Make waves with a beach photo and get more likes",
                                isGoldSubsccriber: true)
}
