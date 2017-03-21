//
//  UIFont+Extensions.swift
//  Peeqr
//
//  Created by East Agile on 1/4/17.
//  Copyright © 2017 node8. All rights reserved.
//

import UIKit

extension UIFont {
  class func defaultFont(ofSize fontSize: CGFloat, weight: CGFloat = UIFontWeightRegular) -> UIFont {
    var fontName = Constant.Fonts.regular
    switch weight {
    case UIFontWeightBold:
      fontName = Constant.Fonts.bold
    case UIFontWeightSemibold:
      fontName = Constant.Fonts.semiBold
    case UIFontWeightLight:
      fontName = Constant.Fonts.light
    default: break
    }

    return customFontWithFallback(name: fontName, size: fontSize, weight: weight)
  }

  class func customFontWithFallback(name: String, size: CGFloat, weight: CGFloat) -> UIFont {
    return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size, weight: weight)
  }
}
