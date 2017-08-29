//
//  LoginManager.swift
//  gestta
//
//  Created by Carlos Henrique on 27/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import RSStarterKit
import KeychainAccess

class LoginManager {
    
    lazy var loginService: LoginServiceProtocol = LoginService()
    lazy var userService: UserServiceProtocol = UserService()
    
    private static let token = "br.com.gestta.user.token"
    static var accessToken: String {
        get {
            
            #if(arch(i386) || arch(x86_64) && (os(iOS) || os(watchOS) || os(tvOS) ) )
            return UserDefaults.standard.string(forKey: LoginManager.token) ?? String()
            #else
            return keychain[LoginManager.token] ?? String()
            #endif
        }
        
        set {
            #if(arch(i386) || arch(x86_64) && (os(iOS) || os(watchOS) || os(tvOS) ) )
            UserDefaults.standard.set(newValue, forKey: LoginManager.token)
            UserDefaults.standard.synchronize()
            #else
            keychain[LoginManager.token] = newValue
            #endif
        }
    }
    
    fileprivate static var keychain: Keychain {
        return Keychain(service: "br.com.gestta.data")
    }

    public func performLogin(email: String, password: String, success: @escaping (User) -> (), failure: @escaping (RSError) -> ()){
        loginService.performLogin(email: email, password: password) { (response) in
            if response.isSuccess {
                LoginManager.accessToken = response.data!
                self.me(success: success, failure: failure)
            } else {
                failure(response.error!)
            }
        }
    }
    
    fileprivate func me(success: @escaping (User) -> Void, failure: @escaping (RSError) -> Void  ){
        userService.me { (response) in
            if response.isSuccess {
                success(response.data!)
            } else {
                failure(response.data as! RSError)
            }
        }
    }

}
