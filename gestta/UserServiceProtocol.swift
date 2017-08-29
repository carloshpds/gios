//
//  LoginServiceProtocol.swift
//  gestta
//
//  Copyright © 2017 redspark. All rights reserved.
//

import Foundation
import RSStarterKit

protocol UserServiceProtocol {
    
    func me(callback: @escaping (RSServiceResponse<User>) -> Void)
}
