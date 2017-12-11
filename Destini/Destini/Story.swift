//
//  Stories.swift
//  Destini
//
//  Created by Radoslav Radoev on 12/10/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation

class Story {
    var storyID : Int
    var storyText : String
    var answer1Text : String
    var answer1Link : Int?
    var answer2Text : String
    var answer2Link : Int?
    
    init(storyID: Int, story : String, answer1 : String, answer2 : String) {
        self.storyID = storyID
        storyText = story
        answer1Text = answer1
        answer2Text = answer2
    }
    
    init(storyID: Int, story : String, answer1 : String, answer2 : String, answer1Lnk: Int, answer2Lnk: Int) {
        self.storyID = storyID
        storyText = story
        answer1Text = answer1
        answer1Link = answer1Lnk
        answer2Text = answer2
        answer2Link = answer2Lnk
    }
}
