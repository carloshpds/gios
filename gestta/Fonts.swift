//
//  Fonts.swift
//  gestta
//
//  Created by Carlos Henrique on 20/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import UIKit


extension UIFont {
    
    enum Style: String, CustomStringConvertible {
        case italic = "Italic"
        case medium = "Medium"
        case regular = "Regular"
        
        var description: String {
            return self.rawValue
        }
    }
    
    static func roboto(style: Style, size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-\(style)", size: size)!
    }
    
    static var text: UIFont {
        return roboto(style: .regular, size: 16)
    }
    
    static var primaryButton: UIFont {
        return roboto(style: .medium, size: 14)
    }
    
    static var forgotButton: UIFont {
        return roboto(style: .regular, size: 15)
    }
    
    static var forgotInfo: UIFont {
        return roboto(style: .italic, size: 15)
    }
    
    static var tab: UIFont {
        return roboto(style: .medium, size: 14)
    }
    
    static var title: UIFont {
        return roboto(style: .medium, size: 18)
    }
    
    static var cellTitle: UIFont {
        return roboto(style: .regular, size: 16)
    }
    
    static var cellInfo: UIFont {
        return roboto(style: .regular, size: 14)
    }
    
    static var cellDate: UIFont {
        return roboto(style: .regular, size: 12)
    }
    
}
