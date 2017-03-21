//
//  Persistence.swift
//  Peeqr
//
//  Created by East Agile on 12/15/16.
//  Copyright © 2016 node8. All rights reserved.
//

import Foundation
import ReactiveKit
import SwiftKeychainWrapper

class Persistence {
  static let shared = Persistence()
  static let keyAccessToken = "access_token"
  static let keyLogged = "logged"
  
  init() {
    accessToken = UserDefaults.standard.string(forKey: Persistence.keyAccessToken)
  }
  
  //example native
  var accessToken: String? {
    didSet {
      accessTokenProperty.value = accessToken != nil
      UserDefaults.standard.set(accessToken, forKey: Persistence.keyAccessToken)
      UserDefaults.standard.synchronize()
    }
  }
  
  //example keychain
  var logged: String? {
    didSet {
      if logged != nil {
        KeychainWrapper.standard.set(logged!, forKey: Persistence.keyLogged)
      } else {
        KeychainWrapper.standard.removeObject(forKey: Persistence.keyLogged)
      }
    }
  }
  
  let accessTokenProperty = Property<Bool>(false)
  
  func reset() {
    accessToken = nil
  }
}
