//
//  WigglyLabel.swift
//  droidDestroyer
//
//  Created by dummy on 8/7/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class WigglyLabel: CCLabelTTF {
    
    override func onEnter(){
        super.onEnter()
        
        self.fontSize = 30
        string = "-2"
        color = CCColor(red: 255, green: 0, blue: 0)
        var moveUp = CCActionMoveBy(duration: 0.8, position: ccp(0,40))
        var delay = CCActionDelay(duration: 0.6)
        var fadeOut = CCActionFadeOut(duration: 0.2)
        var remove = CCActionCallBlock(block: {self.removeFromParent()})
        runAction(moveUp)
        runAction(CCActionSequence(array: [delay, fadeOut, remove]))
        
    }
    
}