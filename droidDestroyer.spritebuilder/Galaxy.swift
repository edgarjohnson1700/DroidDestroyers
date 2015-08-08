//
//  Galaxy.swift
//  droidDestroyer
//
//  Created by dummy on 7/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Galaxy: CCSprite {
 
    func didLoadFromCCB(){
        userInteractionEnabled = true
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        println("Galaxy touched!")
        delegate.galaxyscore()
        removeFromParent()
    }
    
    var delegate: Galaxydelegate!
    
    
    override func onExit() {
        var explosion = CCBReader.load("Explosion") as! CCParticleSystem
        explosion.position = self.position
        parent.addChild(explosion)
        
       
        super.onExit()
    }
    
}

protocol Galaxydelegate {
    func galaxyscore()
}