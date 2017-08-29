//
//  Company.swift
//  gestta
//
//  Created by Carlos Henrique on 20/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import RSStarterKit

class Company: Object {
    
    dynamic var id =  String()
    dynamic var name = String()
    // Add yours models properties here
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}

// MARK: - RSOrm
extension Company: RSOrm {
    typealias MyType = Company
}

// MARK: Mappable
extension Company: Mappable {
    
    func mapping(map: Map) {
        id      <- map["_id"]
        name    <- map["name"]
    }
    
}
