//
//  CardModifier.swift
//  siemob
//
//  Created by Jass on 11/12/19.
//  Copyright © 2019 TUM. All rights reserved.
//

import SwiftUI

struct CardModifier: ViewModifier {
    
    var color: LinearGradient
    
    func body(content: Content) -> some View {
        content
            .padding(16)
            .background(color)
            .cornerRadius(15)
    }
}

extension View {
    func cardButtonViewModifier(color: LinearGradient) -> some View {
        ModifiedContent(content: self, modifier: CardModifier(color: color))
    }
}
