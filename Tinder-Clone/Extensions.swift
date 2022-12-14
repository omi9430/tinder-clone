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
    
#if canImport(UIKit)
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
#endif

}

extension Color {
    
    static let titleText = Color.blue
    static let primaryText = Color.gray.opacity(0.9)
}

//MARK: Hide Navigation bar modifire

struct HideNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
            .navigationTitle("")
            .navigationBarHidden(true)
    }
}
