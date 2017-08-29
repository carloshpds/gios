//
//  LoginService.swift
//  gestta
//
//  Created by Carlos Henrique on 27/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import RSStarterKit
import Alamofire

class LoginService: LoginServiceProtocol {
    
    // MARK - Endpoints
    enum Services: String, RSServiceEndpoint {
      case login = "core/login"
    }
    
    func performLogin(email: String, password: String, callback: @escaping (RSServiceResponse<String>) -> Void) {
        let uri = RSServiceHelper.mountUrl(withEndPoint: Services.login)
        
        let params = [
            "email": email,
            "password": password
        ]
        
        RSServiceHelper.restManager()
            .request(uri, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: [RSHttpStatusCode.success.code])
            .responseString { (response) in
                if response.result.isSuccess, let token = response.response?.allHeaderFields["Authorization"] as? String {
                    callback(RSServiceResponse(withData: token))
                } else {
                    callback(RSServiceResponse(withError: RSServiceError.requestFailure))
                }
                
        
            }
        
    }
}
