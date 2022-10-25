//
//  ProfileViewModel.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 16/10/2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    @Published var promoArray: [PromoModel] = []
    
    init() {
        getPromoData()
    }
    
    
    func getPromoData() {
        
        let item1 = PromoModel(title: "Get More Profile Views", subTitle: "For $99.9")
        let item2 = PromoModel(title: "Get More Profile Followers", subTitle: "For $99.9")
        let item3 = PromoModel(title: "Get More Profile Attention", subTitle: "For $99.9")
        
        promoArray.append(item1)
        promoArray.append(item2)
        promoArray.append(item3)
        
    }
}
