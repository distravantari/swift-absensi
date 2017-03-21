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
    viewModel.user.bidirectionalBind(to: username.reactive.text)
    
    done.reactive.tap.observeNext { [weak self, bag = self.reactive.bag] in
      HUD.show(.systemActivity)
      self?.viewModel.loadRoom().observe { event in
        HUD.hide()
        if case .failed(let error) = event {
          self?.showAlertMessage(error.localizedDescription)
        } else if case .completed = event {
          self?.showSuccessMessage("Please confirm your email address and then log in")
          self?.dismiss(animated: true, completion: nil)
        }
        }.dispose(in: bag)
      }.dispose(in:reactive.bag)
  }
}
