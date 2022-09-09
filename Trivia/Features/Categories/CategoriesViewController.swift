//
//  CategoriesViewController.swift
//  Trivia
//
//  Created by Franco Leto on 08/09/2022.
//

import UIKit

class CategoriesViewController: UIViewController {
  
  private lazy var tableView: UITableView = {
    let table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.delegate = self
    table.dataSource = self
    
    return table
  }()
  
  private var categories = [Category]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    fetchCategories()
  }
  
  // MARK: - Private Functions
  
  private func fetchCategories() {
    categories = [Category(id: 1, name: "Primera"), Category(id: 2, name: "Segunda")]
    reloadCategories()
  }
  
  private func reloadCategories() {
    tableView.reloadData()
  }
  
  private func setupView() {
    setupTableView()
  }
  
  private func setupTableView() {
    view.addSubview(tableView)
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
}

// MARK: - Extensions
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    categories.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = categories[indexPath.row].name
    
    return cell
  }
}
