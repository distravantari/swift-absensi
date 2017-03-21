//
//  LoginJSONParser.swift
//  Peeqr
//
//  Created by East Agile on 12/12/16.
//  Copyright © 2016 node8. All rights reserved.
//

import SwiftyJSON
import ReactiveKit

struct UserJSONParser {
  var error: NSError?
  var user = User()

  init(_ json: JSON) {
    if let id = json["id"].string {
      var _user = User()
      _user.title = id
      user = _user
    } else {
      error = NSError(fromJSON: json)
    }
  }
  
  func toSignal() -> Signal<User, NSError> {
    if let error = self.error {
      return Signal<User, NSError>.failed(error)
    }
    return Signal<User, NSError>.just(user)
  }
}
