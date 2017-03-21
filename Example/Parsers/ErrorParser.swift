//
//  ErrorParser.swift
//  Peeqr
//
//  Created by East Agile on 1/6/17.
//  Copyright © 2017 node8. All rights reserved.
//

import SwiftyJSON
import ReactiveKit

struct ErrorParser {
  var error: NSError?
  let json: JSON
  
  init(_ json: JSON) {
    self.json = json
    for errorJSON in json["detail"].arrayValue {
      if let errorMessage = errorJSON.string, errorMessage == "Invalid token." {
        error = NSError(localizedDescription: errorMessage, code: .invalidToken)
        //clear token
      }
    }
  }
  
  func toSignal() -> Signal<JSON, NSError> {
    if let error = error {
      return Signal<JSON, NSError>.failed(error)
    }
    return Signal<JSON, NSError>.just(json)
  }
}
