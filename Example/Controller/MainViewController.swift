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
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
//    @IBOutlet weak var InitialPhoneNumber: UITextField!
}

extension MainViewController {
    func bindViewModel() {
        secondButton.reactive.tap.observeNext { [weak self] in
            self?.goVeried()
            }.dispose(in: reactive.bag)
    }
    
    //en example using segue (but I still don't know how to do it)
    func goFirst() {
        performSegue(withIdentifier: "fromMainToFirst", sender: nil)
    }
    
    func goVeried() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: FirstViewController.reuseID)
        self.present(controller, animated: true, completion: nil)
    }
    
    func goMainPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: SecondViewController.reuseID)
        self.present(controller, animated: true, completion: nil)
    }
}
