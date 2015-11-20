//
//  OutputViewController.swift
//  Mad Libs
//
//  Created by Mees Fröberg on 17/11/15.
//  Copyright © 2015 Mees. All rights reserved.
//

import UIKit

class OutputViewController: UIViewController {
    
    var story:Story!
    
    // label outlet
    @IBOutlet weak var theStory: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\n\n\n\n\n\n"+story.makeStory()+"\n\n\n\n\n")
        theStory.text = story.makeStory()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}