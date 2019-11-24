//
//  ObjectCell.swift
//  Braille
//
//  Created by Jass on 11/23/19.
//  Copyright © 2019 TUM. All rights reserved.
//

import SwiftUI

struct ObjectCell: View {
    @EnvironmentObject private var learntObjects: LearntObjects
    var id: Object.ID
    
    var body: some View {
        learntObjects.object(id).map({ object in
            VStack {
                Text(object.objectName).font(Font.custom("name-of-font", size: 65)).bold()
                Text("Learnt: \(object.repetition)x")
                    .font(.title)
                
//              Text("knownSince: \(object.dateDescription) ").font(.headline).bold()
                
            }
        })  .frame(width: 300, height: 100)
            .cardButtonViewModifier(color: LinearGradient(gradient: Gradient(colors: [.yellow,.red]), startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}


struct ObjectCell_Previews: PreviewProvider {
    static let learntObjects = LearntObjects.mock
    static var previews: some View {
        ObjectCell(id: learntObjects.learntObjects[2].id)
            .environmentObject(learntObjects)
    }
}
