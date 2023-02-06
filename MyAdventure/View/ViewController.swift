//
//  ViewController.swift
//  MyAdventure
//
//  Created by Dan Kolan on 2/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var promptLabel: UILabel!
    
    @IBOutlet weak var optionOneBtn: UIButton!
    
    @IBOutlet weak var optionTwoBtn: UIButton!
    
    var promptLogic = PromptLogic();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        promptLabel.text = promptLogic.getPrompt(promptLogic.getCurrentCoordinates())
        optionOneBtn.setTitle(promptLogic.getSpecifiedOption(promptLogic.getCurrentCoordinates(), 0), for: .normal)
        optionTwoBtn.setTitle(promptLogic.getSpecifiedOption(promptLogic.getCurrentCoordinates(), 1), for: .normal)
    }
    
    
    @IBAction func choiceSubmitted(_ sender: UIButton) {
        let userAnswer = sender.titleLabel!.text!
        
        promptLogic.compareUserChoice(promptLogic.getCurrentCoordinates(), userAnswer)
//        currentCoordinates = newCoordinates
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
            
        promptLabel.text = promptLogic.getPrompt(promptLogic.getCurrentCoordinates())

        let optionOneTitle = promptLogic.getSpecifiedOption(promptLogic.getCurrentCoordinates(), 0)
        let optionTwoTitle = promptLogic.getSpecifiedOption(promptLogic.getCurrentCoordinates(), 1)
        
//        if (optionOneTitle == "Restart" || optionTwoTitle == "Restart") {
//            currentCoordinates = "0,0"
//            promptLabel.text = promptLogic.getPrompt(currentCoordinates)
//            optionOneBtn.setTitle(promptLogic.getSpecifiedOption(currentCoordinates, 0), for: .normal)
//            optionTwoBtn.setTitle(promptLogic.getSpecifiedOption(currentCoordinates, 1), for: .normal)
//        }
        
        optionOneBtn.setTitle(optionOneTitle, for: .normal)
        optionTwoBtn.setTitle(optionTwoTitle, for: .normal)
        
//        buttonOne.backgroundColor = UIColor.clear
//        buttonTwo.backgroundColor = UIColor.clear
    }
}
