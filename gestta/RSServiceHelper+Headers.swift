//
//  RSServiceHelper+Headers.swift
//  gestta
//
//  Created by Carlos Henrique on 27/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import RSStarterKit
import Alamofire

extension RSServiceHelper {
    
    static var authenticatedHeaders: HTTPHeaders {
        var headers = [String: String]()
        headers["Authorization"] = LoginManager.accessToken
        return headers
    }
    
}
