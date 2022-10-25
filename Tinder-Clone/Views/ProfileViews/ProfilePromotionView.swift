//
//  ProfilePromotionView.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 16/10/2022.
//

import SwiftUI

struct ProfilePromotionView: View {
    
    var titlePromo: String
    var subTitlePromo: String
    var btnAction: () -> Void
    
    var body: some View {
        
        ZStack {
            
           
            VStack(){
                Text(titlePromo)
                    .font(.system(size: 26, weight: .semibold))
                Spacer().frame(height: 8)
                Text(subTitlePromo)
             
               

            }
            .padding(.bottom, 40)
        
            
        }

    }
}

struct ProfilePromotionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePromotionView(titlePromo: "Get More Profile Views", subTitlePromo: "For $99.9 only", btnAction: {
            print("Subscribe button tapped")
        })
    }
}
