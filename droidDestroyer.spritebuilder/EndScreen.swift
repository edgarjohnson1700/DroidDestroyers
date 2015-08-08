//
//  EndScreen.swift
//  droidDestroyer
//
//  Created by dummy on 8/3/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation


class EndScreen : CCNode{
    weak var highScore: CCLabelTTF!
    
    func didLoadFromCCB(){
        var score =  NSUserDefaults.standardUserDefaults().integerForKey("highScore")
        highScore.string = "\(score)"
    }
    
    func restart() {
        let scene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(scene)
        println("Hey, the button is actually working")
    }

    
}
