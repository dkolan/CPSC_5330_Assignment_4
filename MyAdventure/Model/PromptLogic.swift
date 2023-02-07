//
//  PromptLogic.swift
//  MyAdventure
//
//  Created by Dan Kolan on 2/3/23.
//

import Foundation

struct PromptLogic {
    let MAX_DECISION_TREE_DEPTH = 3
    var currentCoordinates : String = "0,0"
    let prompts = [
        "0,0" : Prompt(
            "You find yourself in the entrance of a strange cave. You see two rooms: one with a warm and inviting path that is illuminated by soft light; the other is a dark and foreboding path.",
            "Go left",
            "Go right",
            "caveStart"
        ),
            "1,0" : Prompt(
                "The left room fills with a warm light as you enter; however, you notice two passageways. One is a door and one is a hatch.",
                "Door",
                "Hatch",
                "1-0"
            ),
                "2,0" : Prompt(
                    "You open the door and you are at a crossroads. Ahead is a path lit by glowing mushrooms. To your right is a path lit by flickering torches.",
                    "Go straight",
                    "Go right",
                    "2-0"
                ),
                    "3,0" : Prompt(
                        "The mushroom spores are making you feel woozy. You are now a mushroom. Oh dear.",
                        "Restart",
                        "Restart",
                        "3-0"
                    ),
                    "3,1" : Prompt(
                        "You've found a room filled with gold coins, hooray! Unfortunately, it's all a dream and you wake up in your Tesla sponsored prison cell in Muskburgh, Mars.",
                        "Restart",
                        "Restart",
                        "3-1"
                    ),
                "2,1" : Prompt(
                    "You carefully peek into the hatch. There are eyes peering back at you.",
                    "Slam the hatch shut",
                    "Reach out and pet the creature",
                    "2-1"
                ),
                    "3,2" : Prompt(
                        "You slam the hatch shut, unfortunately on your fingers. You've realized you're made of sand. You have dissolved.",
                        "Restart",
                        "Restart",
                        "3-2"
                    ),
                    "3,3" : Prompt(
                        "The creature can speak! \"We've been trying to reach you concerning your vehicle's extended warranty...\"",
                        "Restart",
                        "Restart",
                        "3-3"
                    ),
        "1,1" : Prompt(
            "The right room has jagged walls and there are gale force winds. There is a chest. You can continue deeper or open the chest.",
            "Continue deeper",
            "Open chest",
            "1-1"
        ),
            "2,2" : Prompt(
                "You continue deeper into the darkness. On the left is a wide and spacious tunnel, while the other is cramped and tight.",
                "Go left",
                "Go right",
                "2-2"
            ),
                "3,4" : Prompt(
                    "You go left and see an illuminated chest which houses the game designers creativity! It's pretty obvious they've been missing it this entire time. Congratulations!",
                    "Restart",
                    "Restart",
                    "3-4"
                ),
                "3,5" : Prompt(
                    "You go right and you've gotten stuck. Your only option is to eat your way out, stone by stone.",
                    "Restart",
                    "Restart",
                    "3-5"
                ),
            "2,3" : Prompt(
                "You open the chest and it's filled with glittering jewels, sparkling gold coins, and ornate artifacts. Do you take them?",
                "Yes",
                "No",
                "2-3"
            ),
                "3,6" : Prompt(
                    "As soon as you touch the coins, you are transported to your Aunt Edith's living room, never to return.",
                    "Restart",
                    "Restart",
                    "3-6"
                ),
                "3,7" : Prompt(
                    "You exercise restraint and shut the chest. You hear a hissing noise and then pass out...",
                    "Restart",
                    "Restart",
                    "3-7"
                )
    ]
    
    mutating func compareUserChoice(_ key: String, _ choice: String) {
        var newCoordinates : String = ""
        let x : Int? = Int(currentCoordinates.components(separatedBy: ",")[0])
        let y : Int? = Int(currentCoordinates.components(separatedBy: ",")[1])
        var newX : Int
        var newY : Int
        
        if choice == prompts[key]?.option_one {
            newX = x! + 1
            newY = y! * 2
            newCoordinates = String(newX) + "," + String(newY)
        } else {
            newX = x! + 1
            newY = (y! * 2) + 1
            newCoordinates = String(newX) + "," + String(newY)
        }
        
        if newX > MAX_DECISION_TREE_DEPTH {
            currentCoordinates = "0,0"
        } else {
            currentCoordinates = newCoordinates
        }
    }
    
    func getPrompt(_ key: String) -> String? {
        guard let prompt = prompts[key]?.prompt else { return ""}
        return prompt
    }
    
    func getSpecifiedOption(_ key: String, _ option: Int) -> String? {
        guard let retOption = option == 0 ? prompts[key]?.option_one : prompts[key]?.option_two else { return "" }
        return retOption
    }
    
    func getCurrentCoordinates() -> String {
        return currentCoordinates
    }
    
    func getBackgroundImage() -> String {
        guard let retImageName = prompts[currentCoordinates]?.image else { return ""}
        return retImageName
    }
}
