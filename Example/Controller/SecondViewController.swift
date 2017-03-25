//
//  SecondViewController.swift
//  Example
//
//  Created by Node8 on 3/21/17.
//  Copyright © 2017 Organization. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit
import PKHUD

class SecondViewController: UIViewController {
  static let reuseID = "SecondViewController"
  fileprivate let viewModel = SecondViewModel()
  @IBOutlet weak var username: UITextField!
  @IBOutlet weak var done: UIButton!
  var onBack: (() -> Void)?
  override func viewDidLoad() {
    super.viewDidLoad()
    bindViewModel()
  }
}

extension SecondViewController {
  func bindViewModel() {
    
  }
}
