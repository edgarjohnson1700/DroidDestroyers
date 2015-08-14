//
//  PickaSide.swift
//  droidDestroyer
//
//  Created by dummy on 8/7/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

var choseIphone: Bool = true

class PickaSide: CCNode {
    
    func didLoadFromCCB(){
        userInteractionEnabled = true
        let audioKit = OALSimpleAudio.sharedInstance()
        audioKit.playBg("sounds/HeroicAge.mp3")


    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        let screenHeight = UIScreen.mainScreen().bounds.height

        
        if touch.locationInWorld().y > (screenHeight / 2) {
            print("scene touched")
//            animationManager.runAnimationsForSequenceNamed("Gameplay")
          choseIphone = true
            transferScene()
        }
        else {
            print("fuckshit")
//            animationManager.runAnimationsForSequenceNamed("Gameplay")
//            let goodGalaxy = CCBReader.load("goodGalaxy") as! CCSprite
//            self.addChild(goodGalaxy)
//            let badIphone = CCBReader.load("badIphone") as! CCSprite
//            self.addChild(badIphone)
            choseIphone = false
            transferScene()
            
        }
        
        
    }
  
    func transferScene() {
        
        let productionScene = CCBReader.loadAsScene("MainScene")
        let transition = CCTransition(crossFadeWithDuration: 1)
        CCDirector.sharedDirector().replaceScene(productionScene, withTransition: transition)
//        CCDirector.sharedDirector().replaceScene(productionScene)
    }

    


}
