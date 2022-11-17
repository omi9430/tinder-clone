//
//  MatchesView.swift
//  Tinder-Clone
//
//  Created by omair khan on 15/11/2022.
//

import SwiftUI
import KingfisherSwiftUI

struct MatchesView: View {
    var person:Person
    var isBlur: Bool
    var body: some View {
        
        GeometryReader { geo in
            ZStack(alignment: .bottomLeading){
                KFImage(person.imageURLs.first)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width,height: geo.size.height)
                    .if(isBlur) {
                        $0.blur(radius: 25)
                    }
                
                Text("\(person.name), \(person.age)")
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 16,weight:.semibold))
                    .if(isBlur) {
                        $0.redacted(reason: .placeholder)
                    }
            }
            .cornerRadius(16)
        }
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView(person: Person.examplePerson, isBlur: false)
            .frame(width: 125)
    }
}
