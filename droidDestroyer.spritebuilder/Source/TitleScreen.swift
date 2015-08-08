//
//  Titlescreen.swift
//  droidDestroyer
//
//  Created by dummy on 8/7/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class TitleScreen: CCNode {
    
    func switchScene() {
        println("works")
        let productionScene = CCBReader.loadAsScene("PickaSide")
        CCDirector.sharedDirector().replaceScene(productionScene)
    }
    
}