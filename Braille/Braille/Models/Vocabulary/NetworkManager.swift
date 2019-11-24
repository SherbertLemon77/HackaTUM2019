//
//  Webservices.swift
//  Braille
//
//  Created by Jass on 11/23/19.
//  Copyright © 2019 TUM. All rights reserved.
//

import Combine
import SwiftUI

class NetworkManager {
    
    var prediction: String = ""
   @EnvironmentObject private var learntObjects: LearntObjects
    let session =  URLSession.shared
    let url = URL(string: "https://sertio.azurewebsites.net/classify")!
    
    func load() {
       session.dataTask(with: url) { (data, response, error) in
            do {
                guard let data = data else { return }
                let objectName = try JSONDecoder().decode(String.self, from: data)
                DispatchQueue.main.async {
                    self.prediction = objectName
                }
            } catch {
                print("Failed To decode: ", error)
            }
        }.resume()
}
    public var printResponse: Void {
        print(self.prediction)
}
}
