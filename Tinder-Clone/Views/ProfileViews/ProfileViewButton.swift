//
//  ProfileViewButton.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 13/10/2022.
//

import SwiftUI

enum profileButtonTypes: String {
    case gear = "gearshape.fill"
    case shield = "shield.fill"
    case camera = "camera.fill"
}

struct ProfileViewButton: View {
    var type: profileButtonTypes
    var btnLabel: String
    
    var body: some View {
        
        /// Buttons for setting and Sheild
            Button {
                
            } label: {
                
                VStack {
                    Image(systemName: type.rawValue)
                        .if(type == .camera , transform: { image in
                            /// Adjust size according to type
                            image
                                .font(.system(size: 40))
                                .foregroundColor(.white)
                                .padding(15)
                                .background(.red)
                                .clipShape(Circle())
                                
                        })
                        .if(type != .camera, transform: { image in
                                image
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.gray.opacity(0.5))
                                    .padding(10)
                                    .background(.white)
                                    .clipShape(Circle())
                                    
                            })
                            .shadow(radius:6)
                       
                    Text(btnLabel)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(Color.black).opacity(0.9)
                }//VStack
                
            }
            
            

        
    }
}

struct ProfileViewButton_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewButton(type: .gear, btnLabel: "Settings")
    }
}
