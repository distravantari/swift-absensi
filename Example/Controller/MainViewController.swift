//
//  MainViewController.swift
//  Example
//
//  Created by Node8 on 3/21/17.
//  Copyright © 2017 Organization. All rights reserved.
//

import UIKit
import Bond
import ReactiveKit

class MainViewController: UIViewController {
  
  @IBOutlet weak var secondButton: UIButton!
  @IBOutlet weak var firstButton: UIButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    bindViewModel()
    // Do any additional setup after loading the view.
  }
}

extension MainViewController {
  func bindViewModel() {
    secondButton.reactive.tap.observeNext { [weak self] in
      self?.goSecond()
      }.dispose(in: reactive.bag)
    firstButton.reactive.tap.observeNext { [weak self] in
      self?.goFirst()
      }.dispose(in: reactive.bag)
  }
  
  func goFirst() {
    performSegue(withIdentifier: "fromMainToFirst", sender: nil)
  }
  
  func goSecond() {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: SecondViewController.reuseID)
    self.present(controller, animated: true, completion: nil)
  }
}
