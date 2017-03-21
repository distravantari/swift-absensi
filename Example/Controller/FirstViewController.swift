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
  @IBOutlet weak var tableView: UITableView!
  fileprivate let viewModel = FirstViewModel()
  let refreshControl = UIRefreshControl()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UINib(nibName: String(describing: ExampleCell.self), bundle: nil), forCellReuseIdentifier: ExampleCell.reuseID)
    addPullToRefresh()
  }
  
  func addPullToRefresh() {
    tableView.addSubview(refreshControl)
    
    refreshControl.reactive.controlEvents(.valueChanged).observeNext { [weak self, bag = self.reactive.bag] in
      self?.viewModel.loadUser().observeCompleted {
        self?.refreshControl.endRefreshing()
        self?.tableView.reloadData()
        }.dispose(in: bag)
      }.dispose(in: reactive.bag)
  }
}

extension FirstViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: ExampleCell.reuseID, for: indexPath) as! ExampleCell
    cell.user = viewModel.user[indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.user.count
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
}

extension FirstViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
}
