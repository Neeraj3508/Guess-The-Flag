//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Neeraj Gupta on 08/09/20.
//  Copyright © 2020 Neeraj Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberofQuestionsAsked = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        
        button1.layer.borderWidth = 1.0
        button2.layer.borderWidth = 1.0
        button3.layer.borderWidth = 1.0
        button1.layer.borderColor = UIColor.black.cgColor
        button2.layer.borderColor = UIColor.black.cgColor
        button3.layer.borderColor = UIColor.black.cgColor
        askQuestion()
    }
    
    func askQuestion(action : UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()) | Score : \(score)"
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
//        numberofQuestionsAsked += 1
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title : String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            numberofQuestionsAsked += 1
        } else {
            title = "Wrong. That's the \(countries[sender.tag].uppercased())"
            score -= 1
            numberofQuestionsAsked += 1
        }
        print(numberofQuestionsAsked)
        
        if numberofQuestionsAsked < 10 {
                let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                present(ac, animated: true)
            
                
            } else {
                let finalac = UIAlertController(title: "Final Score", message: "Your Score is \(score)/10", preferredStyle: .alert)
                finalac.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: askQuestion))
                present(finalac, animated: true)
            score = 0
            }
        }
    }
    

