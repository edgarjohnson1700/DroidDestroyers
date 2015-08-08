//
//  Iphone.swift
//  droidDestroyer
//
//  Created by dummy on 7/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Iphone: CCSprite  {
    
    func didLoadFromCCB(){
        userInteractionEnabled = true
    }
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
       print ("Iphone touched")
       
        delegate.iphoneScore()
        
        
        
        var label = WigglyLabel()
        label.position = touch.locationInWorld()
        parent.addChild(label)
    }
    
    
    
    var delegate: IphoneDelegate!
    
//    override func onExit() {
//        var iphoneExplosion = CCBReader.load("iphoneExplosion") as! CCParticleSystem
//        iphoneExplosion.position = self.position
//        parent.addChild(iphoneExplosion)
//        super.onExit()
//    }
//
    
    
}
    
    
protocol IphoneDelegate {
    func iphoneScore()
    }

