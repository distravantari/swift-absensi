//
//  FirstViewModel.swift
//  Example
//
//  Created by Node8 on 3/21/17.
//  Copyright © 2017 Organization. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class FirstViewModel {
  var user = [User]()
  
  func loadUser() -> Signal<Void, NSError> {
    return ApiRequest.loadUser().map { [weak self] (user) -> Void in
      self?.user.append(user)
      self?.doPreparation()
    }
  }
  
  func doPreparation() {
    //do something
  }
}
