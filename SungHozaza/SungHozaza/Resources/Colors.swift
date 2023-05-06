//
//  Colors.swift
//  SungHozaza
//
//  Created by 077tech on 2023/05/06.
//

import Foundation
import SwiftUI

//MARK: Color Extension for hexcode

extension Color {
    init(hex: UInt) {
        let red = Double((hex >> 16) & 0xff) / 255.0
        let green = Double((hex >> 8) & 0xff) / 255.0
        let blue = Double(hex & 0xff) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}
