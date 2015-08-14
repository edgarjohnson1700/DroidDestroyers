//
//  EndScreen.swift
//  droidDestroyer
//
//  Created by dummy on 8/3/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation


class EndScreen : CCNode{
    weak var yourScore: CCLabelTTF!
    weak var highScore: CCLabelTTF!
    
    func didLoadFromCCB(){
        var highscore =  NSUserDefaults.standardUserDefaults().integerForKey("highScore")

        var yourScoreNum = NSUserDefaults.standardUserDefaults().integerForKey("yourScore")
        
                if yourScoreNum > highscore {
                    NSUserDefaults.standardUserDefaults().setObject(yourScoreNum, forKey:"highScore")
                    var highscore =  NSUserDefaults.standardUserDefaults().integerForKey("highScore")

                }
        
        highScore.string = "\(highscore)"
       
        yourScore.string = "\(yourScoreNum)"
    }
    
    func restart() {
        let scene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(scene)
        println("Hey, the button is actually working")
    }
    
    
}
