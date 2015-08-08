//
//  PickaSide.swift
//  droidDestroyer
//
//  Created by dummy on 8/7/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class PickaSide: CCNode {
    
    func didLoadFromCCB(){
        userInteractionEnabled = true
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        let screenHeight = UIScreen.mainScreen().bounds.height
//        let screenHeight = screenSize * 0.50
        
        if touch.locationInWorld().y > (screenHeight / 2) {
            animationManager.runAnimationsForSequenceNamed("Gameplay")
            
        }
        else {
            animationManager.runAnimationsForSequenceNamed("Gameplay")

        }
        
        
    }
  
    func transferScene() {
        
        let productionScene = CCBReader.loadAsScene("Gameplay")
        let transition = CCTransition(crossFadeWithDuration: 1)
        CCDirector.sharedDirector().replaceScene(productionScene, withTransition: transition)
//        CCDirector.sharedDirector().replaceScene(productionScene)
    }

    


}
