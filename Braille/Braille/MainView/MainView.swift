

import SwiftUI

struct MainView: View {
     @EnvironmentObject private var learntObjects: LearntObjects
   
    var body: some View {
        TabView {
            Summary()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("Main")
            }
            ObjectList().environmentObject(LearntObjects.mock)
                .tabItem {
                    Image(systemName: "book")
                    Text("Vocabulary")
            }
            
        }.environmentObject(LearntObjects.mock)
        .font(.headline)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(LearntObjects.mock)
    }
}
