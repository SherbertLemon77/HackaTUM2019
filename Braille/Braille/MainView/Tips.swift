//
//  Tips.swift
//  Braille
//
//  Created by Jass on 11/24/19.
//  Copyright © 2019 TUM. All rights reserved.
//

import SwiftUI

struct Tips: View {
    var body: some View {
        Text("""
        Tip Of The Week:
                   "Establish consistent daily routines. Because deaf-blind children cannot see or hear things, they need tactile cues and consistent schedules so that they may anticipate the activities that make up their life. Try to start every day with the same routine"
        """).bold().cardButtonViewModifier( color: LinearGradient(gradient: Gradient(colors: [.yellow,.red]), startPoint: .topLeading, endPoint: .bottomTrailing))
        .multilineTextAlignment(.center)
               }
    }


struct Tips_Previews: PreviewProvider {
    static var previews: some View {
        Tips()
    }
}
