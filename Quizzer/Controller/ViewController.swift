//
//  ViewController.swift
//  Quizzer
//
//  Created by Nidhal Messaoudi on 8/12/21.
//  Copyright © 2021 Nidhal Messaoudi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstChoiceBtn: UIButton!
    @IBOutlet weak var secondChoiceBtn: UIButton!
    @IBOutlet weak var thirdChoiceBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let isCorrect = quizBrain.checkAnswer(userAnswer)
        
        if isCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
    
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        
        let answers = quizBrain.getQuestionAnswers()
        
        firstChoiceBtn.setTitle(answers[0], for: .normal)
        secondChoiceBtn.setTitle(answers[1], for: .normal)
        thirdChoiceBtn.setTitle(answers[2], for: .normal)
        
        firstChoiceBtn.backgroundColor = UIColor.clear
        secondChoiceBtn.backgroundColor = UIColor.clear
        thirdChoiceBtn.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
    }
}

