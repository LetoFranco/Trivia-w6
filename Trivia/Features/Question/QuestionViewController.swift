//
//  QuestionViewController.swift
//  Trivia
//
//  Created by Franco Leto on 07/09/2022.
//

import UIKit

class QuestionViewController: UIViewController {
  
  @IBOutlet weak var questionLabel: UILabel!
  
  var categoryId = 0
  private let questions = Game.shared.fetchQuestions()
  private var currentQuestionIndex = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    startGame()
  }
  
  @IBAction func rightAnswerTapped(_ sender: UIButton) {
    didSelect(rightAnswer: true)
  }
  
  @IBAction func wrongAnswerTapped(_ sender: UIButton) {
    didSelect(rightAnswer: false)
  }
  
  // MARK: - Private Functions
  
  private func startGame() {
    guard !questions.isEmpty else { return }
    
    let initialIndex = 0
    loadQuestion(for: initialIndex)
  }
  
  private func restartGame() {
    startGame()
  }
  
  private func loadQuestion(for index: Int) {
    guard index < questions.count else { return restartGame() }
    
    questionLabel.text = questions[index].question
  }
  
  private func didSelect(rightAnswer value: Bool) {
    let result = validateCurrentQuestion(with: value)
    sendMessage(with: result)
  }
  
  private func validateCurrentQuestion(with answer: Bool) -> Bool {
    questions[currentQuestionIndex].answer == answer
  }
  
  private func sendMessage(with result: Bool) {
    let message = result ? "La respuesta es correcta! 🥳" : "La respuesta es incorrecta 😔"
    let alert = UIAlertController(title: "Respuesta", message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default) { _ in
      self.updateQuestion()
    }
    alert.addAction(okAction)
    present(alert, animated: true)
  }
  
  private func updateQuestion() {
    currentQuestionIndex += 1
    loadQuestion(for: currentQuestionIndex)
  }
}
