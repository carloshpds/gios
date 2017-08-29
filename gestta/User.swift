//
//  User.swift
//  gestta
//
//  Created by Carlos Henrique on 20/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import RSStarterKit

class User: Object {
    
    dynamic var id = String()
    dynamic var createAt = Date()
    dynamic var name = String()
    dynamic var email = String()
    dynamic var active = false
    dynamic var company: Company?
    var attempt = RealmOptional<Int>()
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
extension User: RSOrm {
    typealias MyType = User
}

// MARK: Mappable
extension User: Mappable {
    
    func mapping(map: Map) {
        id <- map["id"]
        createAt        <- (map["created_at"], CustomDateTransform())
        company         <- map["company"]
        name            <- map["name"]
        email           <- map["email"]
        active          <- map["active"]
        attempt.value   <- map["attempt"]
    }
    
}
