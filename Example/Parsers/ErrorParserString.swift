//
//  ErrorParserString.swift
//  Presentr
//
//  Created by Node8 on 2/27/17.
//  Copyright © 2017 Lususlab. All rights reserved.
//
import SwiftyJSON
import ReactiveKit

struct ErrorParserString {
  var error: NSError?
  let string: String
  
  init(_ string: String) {
    self.string = string
  }
  
  func toSignal() -> Signal<String, NSError> {
    if let error = error {
      return Signal<String, NSError>.failed(error)
    }
    return Signal<String, NSError>.just(string)
  }
}
