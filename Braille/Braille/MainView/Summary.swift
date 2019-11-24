////
////  Summary.swift
////  Braille
////
////  Created by Jass on 11/24/19.
////  Copyright © 2019 TUM. All rights reserved.
////
//
import SwiftUI
//
struct Summary: View {
    @EnvironmentObject private var objects: LearntObjects
    //filter out

    var body: some View {
        NavigationView {
        VStack {
           
            ScrollView {
                 Text("Learnt/Revised Words").bold()
        ScrollView(.horizontal, content: {
            
            HStack(spacing: 10) {
               
                ForEach(objects.learntObjects) { object in
                   ObjectCellSummary(id: object.id)
                }
            }.padding(20)
        })
               
                Tips().frame(width: 380, height: 200)
              Text("Overview of the progress").bold()
                         Image("GraphMock").resizable().frame(width: 400, height: 250, alignment: .center)
                             
    }.navigationBarTitle("Summary Of The Week")
        }
    }
}
}


struct Summary_Previews: PreviewProvider {
    static var previews: some View {
        Summary().environmentObject(LearntObjects.mock)
    }
}

