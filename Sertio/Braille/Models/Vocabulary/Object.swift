//
//  Words.swift
//  Braille
//
//  Created by Jass on 11/23/19.
//  Copyright © 2019 TUM. All rights reserved.
//

import Foundation

public struct Object: Codable {
    let objectName: String
    var repetition: Int
    let knownSince: Date
    public let id: UUID?
    
    init(id: UUID? = nil, objectName: String, repetition: Int, knownSince: Date) {
        self.id = id ?? UUID()
        self.objectName = objectName
        self.repetition = repetition
        self.knownSince = knownSince
    }
    
    public var dateDescription: String {
           return DateFormatter.onlyDate.string(from: knownSince)
       }
       
       func formatDescription(description: String) -> String? {
           let formatter = TextFormatter()
                 return formatter.string(for: description)
       }
    
       
}

 extension Object: Identifiable { }





