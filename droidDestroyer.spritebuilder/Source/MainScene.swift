import Foundation

class MainScene: CCNode, CCPhysicsCollisionDelegate, Galaxydelegate, IphoneDelegate {
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    var endScreen = true
    var inTutorial = true
    var tutorialSection = 1
    var Gameplay = 3
    weak var iphone: Iphone!
    weak var galaxy: Galaxy!
    weak var ground: CCSprite!
    var gamePhysicsNode: CCPhysicsNode!
    weak var bucket: Bucket!
    var points : NSInteger = 0
    weak var scoreLabel : CCLabelTTF!
    weak var restartButton : CCButton!
    var galaxyArray : [Galaxy] = []
    var iphoneArray : [Iphone] = []
    var lifeCounter = 0
    weak var life: CCSprite!
    weak var life2: CCSprite!
    weak var life3: CCSprite!
    var lifeArray: [CCSprite]!
    var droidSpawnLevel:Int = 0
    var iPhoneSpawnLevel:Int = 0
    var score: Int!
    var lives: Int = 3
    var gameOver = false
    weak var livesLabel: CCLabelTTF!
    func didLoadFromCCB() {
        userInteractionEnabled = false
//        multipleTouchEnabled = true
        gamePhysicsNode.collisionDelegate = self
        gamePhysicsNode.debugDraw = false
        lifeArray = [life,life2,life3]
        //schedule("spawnDroid", interval: 4)
       // schedule("spawnIphone", interval: 5)
    
    }
    
    func fixInteraction(){
        println("fixed interaction!")
        userInteractionEnabled = true
        
    }
   
    
    func spawnDroid () {
        var intScreenWidth = Int(UIScreen.mainScreen().bounds.width)
        var galaxy = CCBReader.load("Galaxy") as! Galaxy
        galaxy.scale = 0.35
        var randomXPosition = CGFloat(arc4random_uniform(UInt32(screenSize.width - CGFloat(galaxy.scale) * galaxy.contentSize.width * 2)))

        galaxy.position = ccp(randomXPosition + CGFloat(galaxy.scale) * galaxy.contentSize.width, UIScreen.mainScreen().bounds.height - 20)
        gamePhysicsNode.addChild(galaxy)
        galaxy.delegate = self
    }
    
    func spawnIphone () {
        var iphone = CCBReader.load("Iphone") as! Iphone
        
        iphone.scale = 0.070
        
        var randomXPosition = CGFloat(arc4random_uniform(UInt32(screenSize.width - CGFloat(iphone.scale) * iphone.contentSize.width * 2)))
        
        iphone.position = ccp( randomXPosition + CGFloat(iphone.scale) * iphone.contentSize.width, UIScreen.mainScreen().bounds.height-20)
        
        gamePhysicsNode.addChild(iphone)
        iphone.delegate = self
    
        println("Iphone Spawn yea")
        println(iphone.position)
    }
    
    func destroyGalaxies(phoneToDestroy: Galaxy) {
        phoneToDestroy.removeFromParent()
                score! += 1
        
        if score > 10 {
            droidSpawnLevel = droidSpawnLevel + 3
        }
            
        else if score > 20 {
            droidSpawnLevel = droidSpawnLevel + 4
        }
        else if score > 30 {
            droidSpawnLevel = droidSpawnLevel + 5
        }
        else if score > 40{
            droidSpawnLevel = droidSpawnLevel + 6
        }
            
        else if score > 50{
            droidSpawnLevel = droidSpawnLevel + 7
        }
        
            }
    
    func iphoneScore () {
        animationManager.runAnimationsForSequenceNamed("deathFlash")
        points -= 2
        scoreLabel.string = String(points)
       if points < 0 {
//            triggerGameOver()
        
        }


    }
    
    override func touchBegan (touch: CCTouch!, withEvent event: CCTouchEvent) {
        println(touch.locationInWorld())
        if inTutorial{
            if tutorialSection == 1{
                animationManager.runAnimationsForSequenceNamed("TutorialPart2")
                tutorialSection = 2
                userInteractionEnabled = false
                
            }
            else if tutorialSection == 2{
              animationManager.runAnimationsForSequenceNamed("Gameplay")
                inTutorial = false
                schedule("spawnDroid", interval: 1)
                schedule("spawnIphone", interval: 1.3)
                
            }
            
            //else if gameOver == true{
               // print ("Screen has ended")
               // animationManager.runAnimationsForSequenceNamed("endScreen")
               // endScreen = true
            //}
        }
        
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, Iphone: CCNode!, collision: CCNode!) -> Bool {
        
    return true
    }
        
        
    func deathFlash() {

    }
    
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, Iphone: CCNode!, level: CCNode!) -> Bool {
        restartButton.visible = true;
        return true
    }
    
    //func restart() {
        //let scene = CCBReader.loadAsScene("MainScene")
        //CCDirector.sharedDirector().presentScene(scene)
       // println("Hey, the button is actually working")
  //  }
    
    override func touchMoved(touch: CCTouch!, withEvent event: CCTouchEvent!) {
     bucket.position.x = touch.locationInWorld().x
    }
    
    func galaxyscore () {
        
        points++
        scoreLabel.string = String(points)
        

    }

    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, iphone: Iphone!, bucket: Bucket!) -> Bool{
    
        print ("Collision Occured")
        iphone.removeFromParent()
        return true
        
        

    
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, galaxy: Galaxy!, ground: CCSprite!) -> Bool {
         lives -= 1
        galaxy.removeFromParent()
        if lifeCounter < 3 {
            if lifeCounter >= 0 {
                lifeArray[lifeCounter].visible = false
                lifeCounter++
            }
        }
        isGameOver()
        print ("Collision Happened")
        return true
    }
    
    
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, iphone: Iphone!, ground: CCSprite!) -> Bool {
        lives -= 1
        iphone.removeFromParent()
        if lifeCounter < 3 {
            if lifeCounter >= 0 {
                lifeArray[lifeCounter].visible = false
                lifeCounter++
            }
        }
        isGameOver()
        print ("collision is there")
        return true
    }
    
    func isGameOver() -> Bool {
        
        if lives == 0 {
//            triggerGameOver()
        }
        
        
        return gameOver
  
    }
    
    
    func triggerGameOver() {
        
       var oldHighScore = NSUserDefaults.standardUserDefaults().integerForKey("highScore")
        if points > oldHighScore {
            NSUserDefaults.standardUserDefaults().setInteger(points, forKey: "highScore")
        }
        
        println("GameOver")
        gameOver = true
        unschedule("spawnDroid")
        unschedule("spawnIphone")
            var endScreen = CCBReader.loadAsScene("endScreen")
            CCDirector.sharedDirector().presentScene(endScreen)

            
        }
        
    }
 

    

