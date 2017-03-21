//
//  Constant.swift
//  Peeqr
//
//  Created by Buu Bui on 12/10/16.
//  Copyright © 2016 node8. All rights reserved.
//

import Foundation
import UIKit

struct Constant {
  struct StatusBarNotification {
    static let duration: Double = 2
    struct Color {
      static let alertBackground = UIColor(red: 0.855, green: 0.2, blue: 0.176, alpha: 1)
      static let successBackground = UIColor(red: 0.188, green: 0.631, blue: 0.29, alpha: 1)
      static let text = UIColor.white
    }
  }
  struct Fonts {
    static let regular = "Montserrat-Regular"
    static let bold = "Montserrat-Bold"
    static let light = "Montserrat-Light"
    static let semiBold = "Montserrat-SemiBold"
    static let medium = "Montserrat-Medium"
    static let thin = "Montserrat-Thin"
  }
}
