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
    

    
}
    
    
protocol IphoneDelegate {
    func iphoneScore()
    }

