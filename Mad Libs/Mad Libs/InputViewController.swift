//
//  InputViewController.swift
//  Mad Libs
//
//  Created by practicum on 09/11/15.
//  Copyright © 2015 Mees. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    var story:Story!
    
    // Label outlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var wordsLeftLabel: UILabel!
    
    // Button outlets
    @IBOutlet weak var button: UIButton!
    
    // Textfield outletsß
    @IBOutlet weak var textInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        story = Story()
        wordsLeftLabel.text = String(story.words.count-story.wordInt) + " word(s) left"
        descriptionLabel.text = "Please type a/an " + story.words[story.wordInt]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "makeStory" {
            if story.words.count-story.wordInt != 1 {
                story.words[story.wordInt] = textInput.text!
                story.wordInt++
                wordsLeftLabel.text = String(story.words.count-story.wordInt) + " word(s) left"
                descriptionLabel.text = "Please type a/an " + story.words[story.wordInt]
                textInput.text = ""
                print(String(story.words))
                return false
            } else {
                story.words[story.wordInt] = textInput.text!
                return true
            }
        }
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "makeStory" {
            let destination = segue.destinationViewController as! OutputViewController
            destination.story = story
        }
    }
}