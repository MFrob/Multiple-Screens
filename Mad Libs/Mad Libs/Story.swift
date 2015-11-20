//
//  Story.swift
//  Mad Libs
//
//  Created by Mees Fröberg on 11/11/15.
//  Copyright © 2015 Mees. All rights reserved.
//

import Foundation

class Story {
    var story:[String]
    var wordInt:Int
    var words:[String]
    
    // Init class with random textfile.
    init(){
        wordInt = 0
        let randomNumber = Int(arc4random_uniform(UInt32(4)))
        let filename = "madlib" + String(randomNumber)
        story = Story.loadText(filename)
        words = Story.getWordTypesStory(story)
    }
    
    // Load textfile.
    private class func loadText(filename:String) -> [String]{
        let filePath = NSBundle.mainBundle().pathForResource(filename, ofType: "txt")
        // Read from file
        do {
            let content = try NSString(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding)
            let lines = content.componentsSeparatedByString("\n")
            var result = [String]()
            for line in lines {
                let words = line.componentsSeparatedByString(" ")
                for word in words {
                    result.append(word)
                }
            }
            return result
        }
        catch {
            print("Failed to read file")
            return []
        }
    }
    
    // Returns the word types that the user has to fill in.
    private class func getWordTypesStory(story:[String]) -> [String] {
        var result = [String]()
        for word in story {
            if !word.isEmpty && word.characters.contains("<") && word.characters.contains(">") {
                result.append(word)
            }
        }
        return result
    }
    
    // Returns the story that the user made up.
    func makeStory() -> String {
        var completeStory = ""
        var i = 0
        for word in story {
            if !word.isEmpty && word.characters.contains("<") && word.characters.contains(">") {
                completeStory = completeStory + words[i] + " "
                i++
            } else {
                completeStory = completeStory + word + " "
            }
        }
        return completeStory
    }
}

