//
//  SecondViewModel.swift
//  Example
//
//  Created by Node8 on 3/21/17.
//  Copyright © 2017 Organization. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit


class SecondViewModel {
  let user = Property<String?>("")
  private var properties: [(String, String?)] {
    return [("Username", user.value)]
  }
  
  func loadRoom() -> Signal<Void, NSError> {
    return FieldsValidator(self.properties).toSignal().flatMapLatest { _ -> Signal<Void, NSError> in
      let user = self.user.value!
      return ApiRequest.loadUser(user: user)
    }
  }
}
