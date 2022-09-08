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
  
  @IBAction func startTriviaTapped(_ sender: Any) {
    guard userTextField.hasText else {
      print("Por favor ingrese un nombre de usuario primero.")
      
      return
    }
    
    let vc = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
    present(vc, animated: true)
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
