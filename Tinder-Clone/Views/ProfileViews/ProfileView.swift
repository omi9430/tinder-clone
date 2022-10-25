//
//  ProfileView.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 13/10/2022.
//

import SwiftUI

struct ProfileView: View {
    
    /// Observing profileViewModel to update the data

    @ObservedObject var profileVM = ProfileViewModel()
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            
            ZStack(alignment:.topTrailing) {
                
                //Profile Image
                RoundedImage(url: URL(string: "https://picsum.photos/400"))
                   // .frame(height: 200)
                
                
                //Profile Image edit Button
                Button {
                    //TODO: Write action for Button
                } label: {
                    Image(systemName: "pencil")
                        .font(.system(size: 18, weight: .heavy))
                        .frame(width: 32, height: 32)
                        .foregroundColor(.blue)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(color: .black, radius: 6)
                }
                .padding(.vertical, 10)
                .offset(x: -12)
                
                
        }//ZStack
            
            /// This group contains user Full name, Profession and the three button
            Group{
                Spacer().frame(height: 18) // Spacer to give space between Zstack and text
                
                Text("Umair Khan")
                    .font(.system(size: 26, weight: .medium))
                    .foregroundColor(Color.blue)
                
                Spacer().frame(height: 8)// Spacer to give space between name text and profession text
                    
                Text("Software Engineer")
                    
                
                Spacer().frame(height: 22)
                /// Create Buttons
                HStack(alignment: .top){
                    /**
                     - Settings Button
                     - Add Media Button
                     - Shield Button
                     */
                    Spacer()
                    ProfileViewButton(type: .gear, btnLabel: "Settings")
                    Spacer()
                    ProfileViewButton(type: .camera, btnLabel: "Picutre")
                    Spacer()
                    ProfileViewButton(type: .shield, btnLabel: "Shield")
                    Spacer()
                }
                
                Spacer().frame(height: 10)
            }
            
         
            
            /// Create Pink HStack
            HStack{
                Text("Photo Tip: Make waves with a beach photo and get more likes")
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                Button {

                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 12,weight: .heavy))
                        .foregroundColor(.pink)
                        .padding(6)

                }
                .background(.white)
                .clipShape(Circle())

            }
            .padding()
            .background(.pink)
            .cornerRadius(10)
            .padding(.horizontal,8)
            
            Spacer()
            ///This is the group for Pormotion SubViews
            Group{
                
                ZStack{
                    VStack{
                        TabView{
                            ForEach(profileVM.promoArray) { item in
                                ProfilePromotionView(titlePromo: item.title, subTitlePromo: item.subTitle) {
                                    print("Hello world")
                                }
                            }
                            
                        }.tabViewStyle(.page)
                        
                        Button {
                            //TODO: Write button action
                        } label: {
                                Text("Subscribe Now")
                                .foregroundColor(.pink)
                                .font(.system(size: 20, weight: .medium))
                                .frame(width: 250, height: 70)
                                
                                
                        }
                        .background(.white)
                        .cornerRadius(50)
                        .shadow(radius: 50,y: 15)
                        .padding(.bottom,10)
                        

                    }
                }
                .background(Color.gray.opacity(0.15))
                
            }
          
         
            
           //Spacer()
            
       
        
        }//VStack
        .background(.white)
        
        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            
    }
}
