//
//  NibIdentifier.swift
//  starter-kit
//  gestta
//
//  Created by Carlos Henrique on 20/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import UIKit
import RSStarterKit

enum NibIdentifier: String, RSCustomIdentifier {
    
    case defaultNib = "DefaultNib"

}

extension NibIdentifier {
    
    func getNib(bundle: Bundle? = nil) -> UINib {
        return UINib(identifier: self, bundle: bundle)
    }
    
}


