//
//  BrailleCell.swift
//  Braille
//
//  Created by Lisa Thiergart on 24/11/2019.
//  Copyright © 2019 TUM. All rights reserved.
//

import SwiftUI

struct BrailleCell: View {
    
    var body: some View {
        HStack {
            VStack {
                Text("⠁⠏⠏⠇⠑")
                    .font(Font.custom("name-of-font", size: 95))
               // Text(BrailleConversion().convert())
            }
        }
    }
}

struct BrailleCell_Previews: PreviewProvider {
    static var previews: some View {
        BrailleCell()
    }
}
