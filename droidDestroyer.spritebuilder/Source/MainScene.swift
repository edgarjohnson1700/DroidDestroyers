import Foundation

class MainScene: CCNode, CCPhysicsCollisionDelegate, Galaxydelegate {
    
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
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
        userInteractionEnabled = true
        gamePhysicsNode.collisionDelegate = self
        gamePhysicsNode.debugDraw = true
        lifeArray = [life,life2,life3]
        schedule("spawnDroid", interval: 2)
        schedule("spawnIphone", interval: 1.7)
    
    }

    override func update(delta: CCTime) {
//        isGameOver()
//        var randomSpawn = arc4random_uniform(30)
//        
//        if Int(randomSpawn) <= droidSpawnLevel {
//            spawnDroid()
//        }
//        
//        if Int(randomSpawn) <= iPhoneSpawnLevel {
//            spawnIphone()
//        }
        
    }
    
    
    func spawnDroid () {
        //        var intScreenWidth = Int(UIScreen.mainScreen().bounds.width)
        var randomXPosition = CGFloat(arc4random_uniform(UInt32(screenSize.width)))
        var galaxy = CCBReader.load("Galaxy") as! Galaxy
        galaxy.position = ccp(randomXPosition, UIScreen.mainScreen().bounds.height - 20)
        gamePhysicsNode.addChild(galaxy)
        galaxy.delegate = self
    }
    
    func spawnIphone () {
        var iphone = CCBReader.load("Iphone") as! Iphone
        var randomXPosition = CGFloat(arc4random_uniform(UInt32(screenSize.width)))
        iphone.position = ccp( randomXPosition, UIScreen.mainScreen().bounds.height-20)
        iphone.scale = 0.040
        gamePhysicsNode.addChild(iphone)
    }
    
    func destroyGalaxies(phoneToDestroy: Galaxy) {
        phoneToDestroy.removeFromParent()
        score! += 1
        
        if score > 10 {
            droidSpawnLevel = droidSpawnLevel + 1
        }
            
        else if score > 20 {
            droidSpawnLevel = droidSpawnLevel + 2
        }
        else if score > 30 {
            droidSpawnLevel = droidSpawnLevel + 3
        }
        else if score > 40{
            droidSpawnLevel = droidSpawnLevel + 4
        }
            
        else if score > 50{
            droidSpawnLevel = droidSpawnLevel + 5
        }
        
            }
    
    override func touchBegan (touch: CCTouch!, withEvent event: CCTouchEvent) {
        println(touch.locationInWorld())
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, Iphone: CCNode!, collision: CCNode!) -> Bool {
        
    return true
    }
        
        
    
    
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, Iphone: CCNode!, level: CCNode!) -> Bool {
        restartButton.visible = true;
        return true
    }
    
    func restart() {
        let scene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    override func touchMoved(touch: CCTouch!, withEvent event: CCTouchEvent!) {
     bucket.position = touch.locationInWorld()
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
       livesLabel.string = "Lives: \(lives)"
        print ("Collision Happened")
        return true
    }
    
    
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, iphone: Iphone!, ground: CCSprite!) -> Bool {
//        lives -= 1
        iphone.removeFromParent()
        print ("collision is there")
        return true
    }
    
    func isGameOver() -> Bool {
        
        if lives == 0 {
            triggerGameOver()
        }
            return gameOver
  
    }
    
    
    func triggerGameOver() {
        println("GameOver")
        gameOver = true
        unschedule("spawnDroid")
        unschedule("spawnIphone")
        restartButton.visible = true
    }

   }

    

