//
//  Iphone.swift
//  droidDestroyer
//
//  Created by dummy on 7/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Iphone: CCSprite {
    
    func didLoadFromCCB(){
        userInteractionEnabled = true
    }
   
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        self.removeFromParent()
    }
    
    
}

