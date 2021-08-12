//
//  Question.swift
//  Quizzer
//
//  Created by Nidhal Messaoudi on 8/12/21.
//  Copyright © 2021 Nidhal Messaoudi. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        question = q
        answers = a
        self.correctAnswer = correctAnswer
    }
}
