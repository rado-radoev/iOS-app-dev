//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var resetButton: UIButton!       // Has TAG = 3
    
    let allStories = StoryBank()
    var storyNumber : Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()      

        restartGame()
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        restartGame()
    }
    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let currentStory : Story = getStory(storyNumber)
    
        setStoryNumber(currentStory, sender)
        updateUI()

    }
    
    func checkEndOfGame(_ currentStory : Story) -> Bool {
        if !currentStory.storyText.isEmpty {
            storyTextView.text = currentStory.storyText
        }
        
        if ((currentStory.answer1Link == nil && currentStory.answer2Link == nil) ||
            (currentStory.answer1Text == "" && currentStory.answer2Text == "")) {
            topButton.isHidden = true
            bottomButton.isHidden = true
            resetButton.isHidden = false
            //ProgressHUD.showSuccess("Game Over")
            return true
        }
        
        return false
    }
    
    func restartGame() {
       // ProgressHUD.show("Let's start over!")
        topButton.isHidden = false
        bottomButton.isHidden = false
        resetButton.isHidden = true
        storyNumber = 1
        updateUI()
    }
    
    func setStoryNumber(_ story: Story, _ sender: UIButton) {

        if !checkEndOfGame(story) {
            if sender.tag == 1 {
                storyNumber = story.answer1Link!
            }
            else if sender.tag == 2 {
                storyNumber = story.answer2Link!
            }
        }
    }
    
    func updateUI() {
        let currentStory : Story = getStory(storyNumber)
        
        if !checkEndOfGame(currentStory) {
            storyTextView.text = currentStory.storyText
            topButton.setTitle(currentStory.answer1Text, for: .normal)
            bottomButton.setTitle(currentStory.answer2Text, for: .normal)
        }
    }
    
    func getStory(_ storyID : Int) -> Story! {
       
        for (_ , value) in allStories.list.enumerated() {
            if storyID == value.storyID {
                return value
            }
        }
        return nil
    }
}

