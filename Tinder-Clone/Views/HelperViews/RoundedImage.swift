//
//  RoundedImage.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 13/10/2022.
//

import SwiftUI
import KingfisherSwiftUI

struct RoundedImage: View {
    
    var url: URL?
    
    var body: some View {
        KFImage(url)
            .resizable()
            .clipShape(Circle())
            .scaledToFit()
        
            
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(url: URL(string: "https://picsum.photos/400"))
    }
}
