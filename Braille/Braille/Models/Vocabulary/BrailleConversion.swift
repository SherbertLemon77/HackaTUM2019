//
//  BrailleConversion.swift
//  Braille
//
//  Created by Lisa Thiergart on 24/11/2019.
//  Copyright © 2019 TUM. All rights reserved.
//

import Foundation

class BrailleConversion {
    var letters : [Character]
    var brailleWord : [Character]
    
    init () {
        let manager = NetworkManager()
        manager.load()
        letters = Array(manager.prediction)
        brailleWord = []
    }
    
    //english alphabet to braille dictionary
    let dictionary : [Character : Character] = ["a":"⠁", "b":"⠃", "c":"⠉" , "d":"⠙", "e":"⠑", "f":"⠋", "g":"⠛", "h":"⠓", "i":"⠊", "j":"⠚", "k":"⠅", "l":"⠇", "m":"⠍", "n":"⠝", "o":"⠕", "p":"⠏", "q":"⠟", "r":"⠗", "s":"⠎", "t":"⠞", "u":"⠥", "v":"⠧", "w":"⠺", "x":"⠭","y":"⠽","z":"⠵"]
    
    //function to convert english word into braille array
    func convert() -> String {
        for c in letters {
            brailleWord.append(dictionary[c] ?? " ")
        }
        return String(brailleWord)
    }
    

    

    
    
    
    
}
