//
//  Titlescreen.swift
//  droidDestroyer
//
//  Created by dummy on 8/7/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class TitleScreen: CCNode {
    func didLoadFromCCB() {
        let audioKit = OALSimpleAudio.sharedInstance()
        audioKit.playBg("sounds/HeroicAge.mp3")
    }
       func switchScene() {
        println("works")
        let productionScene = CCBReader.loadAsScene("PickaSide")
//        let testTransition = CCTransition(pushwit
        let transition = CCTransition(pushWithDirection: CCTransitionDirection.Up, duration: 1)
        CCDirector.sharedDirector().replaceScene(productionScene, withTransition: transition)
//        CCDirector.sharedDirector().replaceScene(productionScene)
    }
    
}