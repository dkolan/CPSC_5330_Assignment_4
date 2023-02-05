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
    
    var currentCoordinates : String = "0,0"
    
    var promptLogic = PromptLogic();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        promptLabel.text = promptLogic.getPrompt(currentCoordinates)
        optionOneBtn.setTitle(promptLogic.getSpecifiedOption(currentCoordinates, 0), for: .normal)
        optionTwoBtn.setTitle(promptLogic.getSpecifiedOption(currentCoordinates, 1), for: .normal)
    }
}
