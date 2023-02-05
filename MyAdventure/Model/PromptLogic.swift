//
//  PromptLogic.swift
//  MyAdventure
//
//  Created by Dan Kolan on 2/3/23.
//

import Foundation

struct PromptLogic {
    var currentCoordinates : String = "0,0"
    let prompts = [
        "0,0" : Prompt(
            "You find yourself in the entrance of a strange cave. You see two rooms: one with a warm and inviting path is illuminated by soft light; the other is a dark and foreboding path beckons.",
            "Go left",
            "Go right"
        ),
        "1,0" : Prompt(
            "The left room fills with a warm light as you enter; however, you notice three passageways. One door, and one hatch.",
            "Door",
            "Hatch"
        ),
        "1,1" : Prompt(
            "The right room has jagged walls and there are gale force winds. There is a chest. You can continue deeper or open the chest.",
            "Continue deeper",
            "Open chest"
        ),
        "2,0" : Prompt(
            "You open the door and a giant hand grabs you and launches in you into space. Goodbye!",
            "Restart",
            "Restart"
        ),
        "2,1" : Prompt(
            "You carefully peek into the hatch. Unfortunately you've been reduced to singularity. Sorry!",
            "Restart",
            "Restart"
        ),
        "2,2" : Prompt(
            "You continue deeper into infinite darkness. See you never!",
            "Restart",
            "Restart"
        ),
        "2,3" : Prompt(
            "You open the chest and it reveals the game makers creativity. Isn't it apparent he lost it some time ago?",
            "Restart",
            "Restart"
        ),
    ]
    
    mutating func compareUserChoice(_ key: String, _ choice: String) -> String {
//        let currentCoordinates = key.components(separatedBy: ",")
//        let x : Int? = Int(currentCoordinates[0])
//        let y : Int? = Int(currentCoordinates[0])
        var newCoordinates : String = ""
        let x : Int? = Int(currentCoordinates.components(separatedBy: ",")[0])
        let y : Int? = Int(currentCoordinates.components(separatedBy: ",")[1])
        
        if choice == prompts[key]?.option_one {
            var newX : Int = x! + 1
            var newY : Int = y! * 2
            newCoordinates = String(newX) + "," + String(newY)
        } else {
            var newX : Int = x! + 1
            var newY : Int = (y! * 2) + 1
            newCoordinates = String(newX) + "," + String(newY)
        }
        return newCoordinates
    }
    
    func getPrompt(_ key: String) -> String {
        guard let prompt = prompts[key]?.prompt else { return "Unknown prompt"}
        return prompt
    }
    
    func getSpecifiedOption(_ key: String, _ option: Int) -> String {
        guard let retOption = option == 0 ? prompts[key]?.option_one : prompts[key]?.option_two else { return "Unknown prompt" }
//        guard let retOption = prompts[key]?.prompt else { return "Unknown prompt"}
        return retOption
    }
    
    // Add new images per prompt?
}
