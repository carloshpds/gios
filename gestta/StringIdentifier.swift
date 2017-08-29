//
//  StringIdentifiers.swift
//  starter-kit
//  gestta
//
//  Created by Carlos Henrique on 20/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import RSStarterKit

enum StringIdentifier: String, RSCustomIdentifier {
    
    case empty
    case userNameLabel

}

extension StringIdentifier {
    
    func getString() -> String {
        return String(withCustomIdentifier: self)
    }
    
}
