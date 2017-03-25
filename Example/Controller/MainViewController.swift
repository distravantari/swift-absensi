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
import DropDown

class MainViewController: UIViewController {
    
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var choosePhoneArea: UIButton!
    @IBOutlet weak var phoneInit: UIView!
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupDropDown()
    }
    
    @IBAction func choosePhoneArea(_ sender: AnyObject) {
        dropDown.show()
    }
    
    
}

extension MainViewController {
    func bindViewModel() {
        secondButton.reactive.tap.observeNext { [weak self] in
            self?.goVeried()
            }.dispose(in: reactive.bag)
    }
    
    func setupDropDown() {
        
        // The view to which the drop down will appear on
        dropDown.anchorView = phoneInit // UIView or UIBarButtonItem
        
        dropDown.bottomOffset = CGPoint(x: 0, y: choosePhoneArea.bounds.height)
        
        // Will set a custom width instead of the anchor view width
        dropDown.width = 400
        
        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = ["Car", "Motorcycle", "Truck"]
        
        // Action triggered on selection
        dropDown.selectionAction = { [unowned self] (index, item) in
            print("Selected item: \(item) at index: \(index)")
        }
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
