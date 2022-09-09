//
//  InitialViewController.swift
//  Trivia
//
//  Created by Franco Leto on 07/09/2022.
//

import UIKit

class InitialViewController: UIViewController {
  
  // MARK: - Attributes
  
  @IBOutlet weak var logoImageView: UIImageView!
  @IBOutlet weak var userTextField: UITextField!
  
  // MARK: - View Controller's Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
   
    addLogoConstraint()
  }
  
  // MARK: - Actions
  
  
  @IBAction func moreInformationBeenTapped(_ sender: Any) {
    let controller = InformationViewController()
    controller.modalPresentationStyle = .overFullScreen
    
    present(controller, animated: true)
  }
  
  @IBAction func startTriviaTapped(_ sender: Any) {
    guard userTextField.hasText else {
      print("Por favor ingrese un nombre de usuario primero.")
      
      return
    }
    
    showHomeController()
  }
  
  private func showHomeController() {
    let tabBarController = UITabBarController()
    
    let questionController = QuestionViewController()
    let questionTitle = "RANDOM"
    let questionImage = UIImage(systemName: "shuffle")
    questionController.title = questionTitle
    questionController.tabBarItem = UITabBarItem(title: questionTitle, image: questionImage, selectedImage: questionImage)
    
    let categoriesController = CategoriesViewController()
    let categoriesTitle = "Categories"
    let categoriesImage = UIImage(systemName: "list.dash")
    let categoriesNavController = UINavigationController(rootViewController: categoriesController)
    categoriesController.title = categoriesTitle
    categoriesNavController.tabBarItem = UITabBarItem(title: categoriesTitle, image: categoriesImage, selectedImage: categoriesImage)
    
    tabBarController.setViewControllers([questionController, categoriesNavController], animated: true)
    let navigationController = UINavigationController(rootViewController: tabBarController)
    navigationController.modalPresentationStyle = .overFullScreen
    tabBarController.navigationBar(isHidden: true)
    
    present(navigationController, animated: true)
  }
  
  private func addLogoConstraint() {
    logoImageView.translatesAutoresizingMaskIntoConstraints = false
    logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    logoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    logoImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    let centerHorizontalConstraint = logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    NSLayoutConstraint.activate([centerHorizontalConstraint])
  }
}


extension UIViewController {
  func navigationBar(isHidden: Bool, animated: Bool = true) {
    navigationController?.setNavigationBarHidden(isHidden, animated: true)
  }
}
