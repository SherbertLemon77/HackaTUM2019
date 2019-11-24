//
//  ObjectList.swift
//  Braille
//
//  Created by Jass on 11/23/19.
//  Copyright © 2019 TUM. All rights reserved.
//

import SwiftUI

struct ObjectList: View {
    @EnvironmentObject private var objects: LearntObjects
    var networkManager = NetworkManager()
    
    
    
    init() {
        networkManager.load()
        networkManager.printResponse
        
        let receivedObject = Object(objectName: networkManager.prediction, repetition: 1, knownSince: Date())
        LearntObjects.mock.addToLearntObjects(object: receivedObject)
    }
    
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(objects.learntObjects) { object in
                        ObjectCell(id: object.id)
                            .foregroundColor(.primary)
                    }.padding(16)
                }
            }
            .navigationBarTitle("Learnt Words 📙")
        }
    }
    
}


struct ObjectList_Previews: PreviewProvider {
    static var previews: some View {
        ObjectList().environmentObject(LearntObjects.mock)
    }
}
