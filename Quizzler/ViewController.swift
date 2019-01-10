//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank() // this initializes the question bank object
    
    var pickedAnswer : Bool = false
    var questionNum: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1
        {
            pickedAnswer = true
        }
        else
        {
            pickedAnswer = false
        }
        
        checkAnswer()
       
        questionNum = questionNum + 1
        
        nextQuestion()
        
        
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNum + 1) / 13"
    
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNum + 1)
    }
    

    func nextQuestion() {
        
        if questionNum <= 12 {
        questionLabel.text = allQuestions.list[questionNum].questionText
            
            updateUI()
        }
        else
        {
            let alert = UIAlertController(title: "Would you like to start again?", message: "Would you like to start again?", preferredStyle: .alert)
            
            let restartaction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartaction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNum].answer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct!")
            print("You got it!")
            score += 1
            
        }
        else
        {
            ProgressHUD.showError("Wrong :(")
            print("You got it wrong :(")
        }
        
    }
    
    
    func startOver() {
        score = 0
       questionNum = 0
        nextQuestion()
        
    }
    

    
}
