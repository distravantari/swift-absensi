//
//  VideoCell.swift
//  Peeqr
//
//  Created by East Agile on 12/16/16.
//  Copyright © 2016 node8. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

enum ExampleStyle: Int {
  case First
  case Second
}

class ExampleCell: UITableViewCell {
  static let reuseID = "ExampleCellID"
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var bgImageView: UIImageView!
  var style = ExampleStyle.First {
    didSet {
      updateStyle()
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    bgImageView.image = UIImage.placeholder
  }

  func updateStyle() {
    if style == .First {
      //do style
    } else {
      //do second style
    }
  }

  var user: User? {
    didSet {
      if let user = user {
        label.text = user.title
      }
    }
  }
}
