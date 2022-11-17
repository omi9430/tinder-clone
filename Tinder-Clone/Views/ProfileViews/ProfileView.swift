//
//  ProfileView.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 13/10/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appStateMng: AppStateManager
    
    /// Observing profileViewModel to update the data
    @ObservedObject var profileVM = ProfileViewModel()
    
    private var user: UserModel {
        return userMng.currentUser
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            
            ZStack(alignment:.topTrailing) {
                
                //Profile Image
                RoundedImage(url: user.imageUrls.first)
                    .frame(height: 200)
                
                
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
                
                Text("\(user.name), \(user.age)" )
                    .font(.system(size: 26, weight: .medium))
                    .foregroundColor(Color.blue)
                
                Spacer().frame(height: 8)// Spacer to give space between name text and profession text
                    
                Text(user.jobTitle)
                    
                
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
            if !user.profileTip.isEmpty{ ///Show the tip only if it is not empty
                HStack{
                    Text(user.profileTip)
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
            }
            
            Spacer()
            
            
            ///This is the group for Pormotion SubViews
            if !user.isGoldSubsccriber {
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
                                appStateMng.showSubscriptionPopUp()
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
            }
            
           Spacer()
        }//VStack
        .background(.white)
        
        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
