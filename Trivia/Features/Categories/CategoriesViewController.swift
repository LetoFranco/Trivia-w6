//
//  CategoriesViewController.swift
//  Trivia
//
//  Created by Franco Leto on 08/09/2022.
//

import Alamofire
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
    let request = AF.request("https://opentdb.com/api_category.php")
    request.response { [weak self] response in
      guard let self = self else { return }
      
      switch response.result {
      case .success(let data):
        do {
          guard let data = data else { return }
          let trivia = try JSONDecoder().decode(Trivia.self, from: data)
          
          self.categories = trivia.categories
          self.reloadCategories()
        } catch {
          self.showError(message: error.localizedDescription)
        }
      case .failure(let error):
        self.showError(message: error.localizedDescription)
      }
    }
  }
  
  private func showError(message: String) {
    print("Ha ocurrido un error: ", message)
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
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    let category = categories[indexPath.row]
    let controller = QuestionViewController()
    controller.categoryId = category.id
    controller.title = category.name
    
    navigationController?.pushViewController(controller, animated: true)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    categories.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    cell.textLabel?.text = categories[indexPath.row].name
    
    return cell
  }
}
