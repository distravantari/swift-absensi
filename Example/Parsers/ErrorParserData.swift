//
//  ErrorParser.swift
//  Peeqr
//
//  Created by East Agile on 1/6/17.
//  Copyright © 2017 node8. All rights reserved.
//

import SwiftyJSON
import ReactiveKit

struct ErrorParserData {
  var error: NSError?
  let data: Data
  
  init(_ data: Data) {
    self.data = data
  }
  
  func toSignal() -> Signal<Data, NSError> {
    if let error = error {
      return Signal<Data, NSError>.failed(error)
    }
    return Signal<Data, NSError>.just(data)
  }
}

