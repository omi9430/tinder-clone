//
//  Extensions.swift
//  Tinder-Clone
//
//  Created by MacBooK Pro on 12/10/2022.
//

import Foundation
import SwiftUI

extension View {
   @ViewBuilder
    func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform ) -> some View{
        if condition {
            transform(self)
        }else{
            self
        }
    }

}

extension Color {
    
    static let titleText = Color.blue
    static let primaryText = Color.gray.opacity(0.9)
}
