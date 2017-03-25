//
//  FirstViewController.swift
//  Example
//
//  Created by Node8 on 3/21/17.
//  Copyright © 2017 Organization. All rights reserved.
//

import UIKit
import Bond

class FirstViewController: UIViewController {
    static let reuseID = "FirstViewController"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var submitButton: UIButton!
    
    fileprivate let viewModel = FirstViewModel()
    let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
}

extension FirstViewController {
    func bindViewModel() {
        submitButton.reactive.tap.observeNext { [weak self] in
            self?.submit()
            }.dispose(in: reactive.bag)
    }
    
    func submit() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: SecondViewController.reuseID)
        self.present(controller, animated: true, completion: nil)
    }
}
