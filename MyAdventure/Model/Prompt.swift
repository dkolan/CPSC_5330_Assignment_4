//
//  Prompt.swift
//  MyAdventure
//
//  Created by Dan Kolan on 2/3/23.
//

import Foundation

struct Prompt {
    init(_ prmpt: String, _ o_one: String, _ o_two: String) {
        prompt = prmpt
        option_one = o_one
        option_two = o_two
    }
    
    var prompt : String
    var option_one : String
    var option_two : String
}
