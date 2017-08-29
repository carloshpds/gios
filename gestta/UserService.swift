//
//  LoginServiceProtocol.swift
//  gestta
//
//  Created by Carlos Henrique on 27/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import RSStarterKit

class UserService: UserServiceProtocol{
    
    // MARK - Endpoints
    enum Services: String, RSServiceEndpoint {
        case me = "core/company/user/me"
    }
    
    func me(callback: @escaping (RSServiceResponse<User>) -> Void) {
        let uri = RSServiceHelper.mountUrl(withEndPoint: Services.me)
        
        RSServiceHelper.get(url: uri, parameters: nil, headers: RSServiceHelper.authenticatedHeaders, callbackForObject: callback)
    }
}
