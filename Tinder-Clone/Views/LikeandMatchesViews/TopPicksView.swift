//
//  TopPicksView.swift
//  Tinder-Clone
//
//  Created by omair khan on 16/11/2022.
//

import SwiftUI

struct TopPicksView: View {
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appStateMng: AppStateManager
    
    private var user: UserModel {
        return userMng.currentUser
        
    }
    var body: some View {
       
        ScrollView(.vertical,showsIndicators: false) {
            if !user.isGoldSubsccriber{
                ///Show this messasge to users who are not prremium
                Text("Upgrade to Gold to See Top Picks for You! ")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black.opacity(0.7))
                    .font(.system(size: 16, weight: .medium))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 24)
            }
           
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],alignment: .center) {
                ForEach(userMng.topPicks) { personMatched in
                    MatchesView(person: personMatched, isBlur: false)
                        .frame(height: 240)/// this view gets height from parent and grid view is juust taking care of width thats why we need to provide a height
                }

            }//LazyVGrid
            .padding()
        }//ScrollView
    }//body
    
    func personTapped(_ person: Person){
        if user.isGoldSubsccriber{
            appStateMng.showPersonProfile(person)
        }else{
            appStateMng.showSubscriptionPopUp()
        }
    }
    
    
    
}

struct TopPicksView_Previews: PreviewProvider {
    static var previews: some View {
        TopPicksView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
