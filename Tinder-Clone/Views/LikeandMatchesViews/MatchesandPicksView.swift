//
//  MatchesandPicksView.swift
//  Tinder-Clone
//
//  Created by omair khan on 16/11/2022.
//

import SwiftUI

struct MatchesandPicksView: View {
    
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appStateMng: AppStateManager
    @State private var selectedTab:TabOptions = .likes
    @State private var textForSubBtn: String =  "See Who Likes You"
    
    enum TabOptions{
        case likes
        case topPicks
    }
    
    func subscribeBtnAction(){
        appStateMng.showSubscriptionPopUp()
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing:0){
                HStack{
                    Spacer()
                    Button {
                        /**
                         - call subscribe button action
                         - change selected tab
                         - change text for textForSubBtn
                         */
                        subscribeBtnAction()
                        selectedTab = .likes
                        self.textForSubBtn = "SEE WHO LIKES YOU"
                    } label: {
                        Text("\(userMng.topPicks.count) Likes")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(.black.opacity(0.8))
                            .if(selectedTab == .topPicks) {
                                $0.opacity(0.5)
                            }
                    }
                    Spacer()
                    Button {
                        /**
                         - call subscribe button action
                         - change selected tab
                         - change text for textForSubBtn
                         */
                        subscribeBtnAction()
                        selectedTab = .topPicks
                        self.textForSubBtn = "UNLOCK TOP PICKS"
                    } label: {
                        Text("\(userMng.topPicks.count) Top Picks")
                            .font(.system(size: 22, weight: .semibold))
                            .foregroundColor(.black.opacity(0.8))
                            .if(selectedTab == .likes) {
                                $0.opacity(0.5)
                            }
                    }
                    Spacer()
                }//HStack
                Divider()
                    .padding(.vertical,6)
                Spacer()
                
                
                // MARK:  Show view depending upon the selected tab
               
                if selectedTab == .likes {
                    LikeViews()
                }else{
                    TopPicksView()
                }
            }//VStack
            
            if !userMng.currentUser.isGoldSubsccriber{
                Button {
                
                } label: {
                    Text(textForSubBtn)
                        .padding(.vertical,14)
                        .padding(.horizontal,36)
                        .font(.system(size: 22, weight: .bold))
                        .background(Color.yellow)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.bottom, 40)
            }
      
        }//Zstack
    }
}

struct MatchesandPicksView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesandPicksView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
