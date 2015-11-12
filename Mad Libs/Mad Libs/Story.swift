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
    
    // Init class with random textfile.
    init(){
        let randomNumber = Int(arc4random_uniform(UInt32(4)))
        let filename = "madlib" + String(randomNumber)
        story = Story.loadText(filename)
    }
    
    // Init class with given textfile.
    init(filename:String){
        story = Story.loadText(filename)
    }
    
    // Load textfile.
    private class func loadText(filename:String) -> [String]{
        let filePath = NSBundle.mainBundle().pathForResource(filename, ofType: "txt")
        // Read from file
        do {
            let content = try NSString(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding)
            return content.componentsSeparatedByString("\n")
        }
        catch {
            print("Failed to read file")
            return []
        }
    }
    
    // Returns the word types that the user has to fill in.
    func getWordTypesStory() -> [String] {
        var result = [String]()
        for word in story {
            if word[word.startIndex] == "<" && word[word.endIndex] == ">" {
                result.append(word)
            }
        }
        return result
    }
    
    // Returns the story that the user made up.
    func makeStory(words:[String]) -> String {
        var completeStory = ""
        var i = 0
        for word in story {
            if word[word.startIndex] == "<" && word[word.endIndex] == ">" {
                completeStory = completeStory + words[i]
                i++
            } else {
                completeStory = completeStory + word
            }
        }
        return completeStory
    }
}

