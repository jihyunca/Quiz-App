//
//  Question.swift
//  Quizzler
//
//  Created by Lizzie Kim on 2018-12-27.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    } // put in an initializer for the class instead of assigning real values
    
}

