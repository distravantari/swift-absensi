//
//  UserParser.swift
//  Example
//
//  Created by Node8 on 3/21/17.
//  Copyright © 2017 Organization. All rights reserved.
//

import SwiftyJSON
import ReactiveKit

struct RoomJSONParser {
  var error: NSError?
  
  init(_ json: JSON) {
    if let results = json["results"].array {
      for room in results {
        // do json array
      }
    } else {
      error = NSError(localizedDescription: "No results found")
    }
  }
  
  func toSignal() -> Signal<Void, NSError> {
    return Signal<Void, NSError> { producer in
      if let error = self.error {
        producer.failed(error)
      } else {
        producer.completed(with: Void())
      }
      return NonDisposable.instance
    }
  }
}
