//
//  QuestionViewController.swift
//  Trivia
//
//  Created by Franco Leto on 07/09/2022.
//

import UIKit

class QuestionViewController: UIViewController {
  
  @IBOutlet weak var questionLabel: UILabel!
  
  private let questions = Game.shared.fetchQuestions()
  private var currentQuestionIndex = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setCurrentQuestion(for: 0)
  }
  
  @IBAction func rightAnswerTapped(_ sender: UIButton) {
    let result = validateCurrentQuestion(with: true)
    sendResult(result)
  }
  
  @IBAction func wrongAnswerTapped(_ sender: UIButton) {
    let result = validateCurrentQuestion(with: false)
    sendResult(result)
  }
  
  // MARK: - Private Functions
  
  private func updateQuestion() {
    currentQuestionIndex += 1
    setCurrentQuestion(for: currentQuestionIndex)
  }
  
  private func setCurrentQuestion(for index: Int) {
    if index < questions.count {
      questionLabel.text = questions[index].question
    } else {
      currentQuestionIndex = 0
      questionLabel.text = questions[currentQuestionIndex].question
    }
  }
  
  private func validateCurrentQuestion(with answer: Bool) -> Bool {
    questions[currentQuestionIndex].answer == answer
  }
  
  private func sendResult(_ result: Bool) {
    if result {
      print("El usuario ha respondido correctamente.")
    } else {
      print("El usuario ha respondido incorrectamente.")
    }
    updateQuestion()
  }
}
