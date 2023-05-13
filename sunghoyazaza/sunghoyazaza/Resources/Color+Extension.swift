//
//  Colors.swift
//  sunghoyazaza
//
//  Created by 077tech on 2023/05/06.
//

import Foundation
import SwiftUI

//MARK: HexCode 적용을 위한 Extension

extension Color {
    init(hex: UInt) {
        let red = Double((hex >> 16) & 0xff) / 255.0
        let green = Double((hex >> 8) & 0xff) / 255.0
        let blue = Double(hex & 0xff) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
    
    // MARK: ColorScale - PrimaryColor
    static let accentColor = primary
    /// 강조색 - 1
    static let primary = Color(#colorLiteral(red: 0.07639225572, green: 0.1141367927, blue: 0.6474509239, alpha: 1))
    /// 강조색 - 2
    static let primary2 = Color(#colorLiteral(red: 0.8509803922, green: 0.8823529412, blue: 1, alpha: 1))
    /// 강조색 - 2
    static let primary3 = Color(#colorLiteral(red: 0.9647058824, green: 0.9725490196, blue: 1, alpha: 1))
    
    
    // MARK: ColorScale - SecondaryColor
    static let systemGreen = Color(UIColor.systemGreen)
    static let systemRed = Color(UIColor.systemRed)
    
    // MARK: GrayScale
    static let systemWhite = Color(UIColor.white)
    /// 서브 타이틀 텍스트 컬러
    static let systemGray = Color(UIColor.systemGray)
    /// 버튼 disabled 텍스트 컬러
    static let systemGray2 = Color(UIColor.systemGray2)
    static let systemGray3 = Color(UIColor.systemGray3)
    /// 버튼 disabled 배경 컬러
    static let systemGray4 = Color(UIColor.systemGray4)
    static let systemGray5 = Color(UIColor.systemGray5)
    /// 앱 전역 배경색
    static let systemGray6 = Color(UIColor.systemGray6)
    /// 디폴트 텍스트 컬러
    static let systemBlack = Color(UIColor.black)
}

extension UIColor {
    // MARK: ColorScale - PrimaryColor
    /// 강조색 - 1
    static let primary = #colorLiteral(red: 0.07639225572, green: 0.1141367927, blue: 0.6474509239, alpha: 1)
    /// 강조색 - 2
    static let primary2 = #colorLiteral(red: 0.8509803922, green: 0.8823529412, blue: 1, alpha: 1)
}
