//
//  LearntObjects.swift
//  Braille
//
//  Created by Jass on 11/23/19.
//  Copyright © 2019 TUM. All rights reserved.
//

import Foundation

public class LearntObjects {
    
    //@Published because if changed all views using it are refreshed.
     @Published public private(set) var learntObjects: [Object]
    
    init(objects: [Object]) {
        self.learntObjects = objects
    }
    
    public func object(_ id: Object.ID) -> Object? {
    for object in learntObjects where object.id == id {
        return object
    }
    return nil
}
    func addToLearntObjects(object: Object) -> Void {
        if let index = learntObjects.firstIndex(where: { object.objectName == $0.objectName }) {
            learntObjects[index].repetition+=1
        } else {
            learntObjects.append(object)
        }
         
    }
    //only keep todays
    func filterObjects(_: [Object]) -> [Object] {
         learntObjects.filter({$0.knownSince != Date() })
    }
        
}
//to be able to share these data among the views
extension LearntObjects: ObservableObject { }

extension LearntObjects {

    public static var mock: LearntObjects {
    let mock = LearntObjects( objects: [
        Object(objectName: "Apple", repetition: 1, knownSince: Date()),
        Object(objectName: "Cup", repetition: 1, knownSince: Date())
    ])
     return mock
}
}
