import SpriteKit
import GameplayKit

//class GameScene: SKScene {

// 
// STAGE 11: Collision detection
//

class GameScene: SKScene, SKPhysicsContactDelegate {

  //
  // STAGE 1: Make bird flap
  //
  var bird: SKSpriteNode!;
  
  //
  // STAGE 8: Add pipes
  //
  
  let verticalPipeGap: CGFloat = 100.0;
  
  //
  // STAGE 9: Abstract pipe logic into reusable function
  //
  
  let pipeUpTexture = SKTexture(imageNamed: "Pipe1");
  let pipeDownTexture = SKTexture(imageNamed: "Pipe2");
  var moveAndRemovePipesAction: SKAction!;
  
  // 
  // STAGE 11: Collision detection
  // Collision - prevents objects from intersecting - default behavior when physics bodies are added
  // Contact - when we need to know two objects touch so we change the gameplay.
  //
  
  let birdCategory: UInt32 = 1 << 0;
  let worldCategory: UInt32 = 1 << 1;
  let pipeCategory: UInt32 = 1 << 2;
  
  //
  // STAGE 13: Keeping Score
	//
  
  let scoreCategory: UInt32 = 1 << 3;
  
  //
  // STAGE 12: Master node
  // 
  
  let masterNode = SKNode();
  let masterPipesNode = SKNode();
  
  // 
  // STAGE 13: Keeping score
  //
  
  var score = 0;
  let scoreLabel = SKLabelNode(fontNamed: "MarkerFelt-Wide");
  
  //
  // STAGE 14: Game over
  // 
  
  let gameOverLabel = SKLabelNode(fontNamed: "MarkerFelt-Wide");
  let restartLabel = SKLabelNode(fontNamed: "MarkerFelt-Wide");
  
  override func didMove(to view: SKView) {
    self.backgroundColor = SKColor.black;
    let skyColor = SKColor(
      red: 113.0/255.0,
      green: 197.0/255.0,
      blue: 207.0/255.0,
      alpha: 1.0
    );
    self.backgroundColor = skyColor;
    
    //
    // STAGE 12: Master node
    //
    
    addChild(masterNode);
    
    //
    // STAGE 14: Game Over
    //
    
    gameOverLabel.position = CGPoint(
      x: self.frame.width / 2,
      y: self.frame.height - 100
    );
    gameOverLabel.text = "Game Over!";
    gameOverLabel.isHidden = true;
    addChild(gameOverLabel);

    restartLabel.position = CGPoint(
      x: self.frame.width / 2,
      y: self.frame.height - 140
    );
    restartLabel.text = "Tap to Restart";
    restartLabel.isHidden = true;
    addChild(restartLabel);
    
    // 
    // STAGE 13: Keeping score
    //
    
    scoreLabel.position = CGPoint(
      x: self.frame.size.width / 2,
      y: self.frame.size.height / 4
    );
    scoreLabel.zPosition = 100;
    scoreLabel.text = String(score);
    masterNode.addChild(scoreLabel);
    
    //
    // STAGE 11: Collision detection
    //
    
    self.physicsWorld.contactDelegate = self;
    
    // 
    // STAGE 1: Make bird flap
    //

    let bird1Texture = SKTexture(imageNamed: "Bird1");
    let bird2Texture = SKTexture(imageNamed: "Bird2");

    bird = SKSpriteNode(texture: bird1Texture);
    bird.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2);
    bird.setScale(2.0);

    let animateAction = SKAction.animate(
      with: [bird1Texture, bird2Texture],
      timePerFrame: 0.2
    );
    let flapAction = SKAction.repeatForever(animateAction);
    
  	//
    // STAGE 12: Master node
    //
    
    masterNode.addChild(bird);
    masterNode.addChild(masterPipesNode);
    
//    addChild(bird);
    bird.run(flapAction); // give action to spire to perform
   
    // 
    // STAGE 2: Add physics to the bird
    //
    
    bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.width / 2);
    bird.physicsBody?.isDynamic = true; // apply gravity, friction, and collision
    bird.physicsBody?.allowsRotation = false;
    
    //
    // STAGE 11: Collision detection
    //
    
    bird.physicsBody?.categoryBitMask = birdCategory;
    bird.physicsBody?.collisionBitMask = worldCategory | pipeCategory;
    bird.physicsBody?.contactTestBitMask = worldCategory | pipeCategory;
    
    //
    // STAGE 3: Add ground
    //

    let groundTexture = SKTexture(imageNamed: "Ground");
    let groundTileCount = Int(self.frame.size.width / (groundTexture.size().width * 2)) * 2;
    
    //
    // STAGE 6: Make the ground move
    //
    
    let moveGroundAction = SKAction.moveBy(
      x: -groundTexture.size().width * 2,
      y: 0,
      duration: TimeInterval(0.02 * groundTexture.size().width * 2)
    );
    // STAGE 6: let moveGroundForeverAction = SKAction.repeatForever(moveGroundAction);

    //
    // STAGE 7: Reset the ground position
    //

    let resetGroundAction = SKAction.moveBy(
      x: groundTexture.size().width * 2,
      y: 0,
      duration: 0
    );
    let moveGroundForeverAction = SKAction.repeatForever(
      SKAction.sequence([moveGroundAction, resetGroundAction])
    );
    
    // 
    // STAGE 3 (continued): Add ground
    //
    
    for i in 0...groundTileCount {
      let groundTileSprite = SKSpriteNode(texture: groundTexture);
      groundTileSprite.setScale(2.0);
      
      groundTileSprite.position = CGPoint(
        x: CGFloat(i) * groundTileSprite.size.width,
        y: groundTileSprite.size.height / 2 // because anchor point is in the middle
      );
      
      //
      // STAGE 6: Make the ground move
      //

      groundTileSprite.run(moveGroundForeverAction);
      
      //
      // STAGE 12: Master node
      //
      
      masterNode.addChild(groundTileSprite);
    }
    
    // 
    // STAGE 4: Add physics to the ground
    //
    
    let ground = SKNode()
    ground.position = CGPoint(
      x: self.frame.size.width / 2,
      y: groundTexture.size().height
    );
    ground.physicsBody = SKPhysicsBody(
      rectangleOf: CGSize(
        width: self.size.width,
        height: groundTexture.size().height * 2
      )
    );
    ground.physicsBody?.isDynamic = false;
    addChild(ground);
    
  	//
    // STAGE 11: Collision detection
  	//
    
    ground.physicsBody?.categoryBitMask = worldCategory;
    
    //
    // STAGE 8: Add pipes
    //
    
//    let pipeUpTexture = SKTexture(imageNamed: "Pipe1");
//    let pipeDownTexture = SKTexture(imageNamed: "Pipe2");
//    
//    let pipeY = random(lower: 0.0, upper: self.frame.size.height / 3);
//    
//    let pipeUpSprite = SKSpriteNode(texture: pipeUpTexture);
//    pipeUpSprite.position = CGPoint(x: 0, y: pipeY);
//    pipeUpSprite.setScale(2.0);
//    pipeUpSprite.physicsBody = SKPhysicsBody(rectangleOf: pipeUpSprite.size);
//    pipeUpSprite.physicsBody?.isDynamic = false;
//    
//    let pipeDownSprite = SKSpriteNode(texture: pipeDownTexture);
//    pipeDownSprite.position = CGPoint(
//      x: 0,
//      y: pipeY + pipeUpTexture.size().height * 2 + verticalPipeGap
//    );
//    pipeDownSprite.setScale(2.0);
//    pipeDownSprite.physicsBody = SKPhysicsBody(rectangleOf: pipeUpSprite.size);
//    pipeDownSprite.physicsBody?.isDynamic = false;
//    
//    let pipes = SKNode();
//    pipes.position = CGPoint(
//      x: self.frame.size.width + pipeUpTexture.size().width,
//      y: 0
//    );
//    pipes.zPosition = -10;
//    pipes.addChild(pipeUpSprite);
//    pipes.addChild(pipeDownSprite);
//    
//    let movePipesAction = SKAction.moveBy(x: -1, y: 0, duration: 0.02);
//    let movePipesForeverAction = SKAction.repeatForever(movePipesAction);
//    
//    pipes.run(movePipesForeverAction);
//    addChild(pipes);
  
  	// 
    // STAGE 9: Abstract pipe logic into reusable function
    //
    
    let distanceToMove = self.frame.size.width + pipeUpTexture.size().width * 3;
    let movePipesAction = SKAction.moveBy(
      x: -distanceToMove,
      y: 0,
      duration: TimeInterval(CGFloat(0.01 * distanceToMove))
    );
    let removePipesAction = SKAction.removeFromParent();
    moveAndRemovePipesAction = SKAction.sequence([movePipesAction, removePipesAction]);
    
//    spawnPipes();
    
    //
    // STAGE 10: Spawn pipes
    //
    
    let spawnAction = SKAction.perform(#selector(spawnPipes), onTarget: self);
    let delayAction = SKAction.wait(forDuration: 2.0);
    let spawnThenDelayAction = SKAction.sequence([spawnAction, delayAction]);
    let spawnThenDelayForeverAction = SKAction.repeatForever(spawnThenDelayAction);
    self.run(spawnThenDelayForeverAction);
  }

  //
  // STAGE 5: Add impulse on scene/screen touch
  //

override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //
    // STAGE 12: Master node
    //
    
    if (masterNode.speed > 0) {
      //
      // STAGE 5: Add impulse on scene/screen touch
      //
      
      bird.physicsBody?.velocity.dy = 0;
      bird.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 12));
    }
    else {
      // 
      // STAGE 14: Game over
      //
      
      resetScene();
    }
  }
  
  //
  // STAGE 9: Abstract pipe logic into reusable function
  //
  
  func spawnPipes() {
    let pipeY = random(
      lower: self.frame.size.height / 8,
      upper: self.frame.size.height / 4
    );

    let pipeUpSprite = SKSpriteNode(texture: pipeUpTexture);
    pipeUpSprite.position = CGPoint(x: 0, y: pipeY);
    pipeUpSprite.setScale(2.0);
    pipeUpSprite.physicsBody = SKPhysicsBody(rectangleOf: pipeUpSprite.size);
    pipeUpSprite.physicsBody?.isDynamic = false;

    // 
    // STAGE 11: Collision detection
    //
    
    pipeUpSprite.physicsBody?.categoryBitMask = pipeCategory;
    pipeUpSprite.physicsBody?.contactTestBitMask = birdCategory;

    let pipeDownSprite = SKSpriteNode(texture: pipeDownTexture);
    pipeDownSprite.position = CGPoint(
      x: 0,
      y: pipeY + pipeUpSprite.size.height + verticalPipeGap
    );
    pipeDownSprite.setScale(2.0);
    pipeDownSprite.physicsBody = SKPhysicsBody(rectangleOf: pipeUpSprite.size);
    pipeDownSprite.physicsBody?.isDynamic = false;

    //
    // STAGE 11: Collision detection
    //
    
    pipeDownSprite.physicsBody?.categoryBitMask = pipeCategory;
    pipeDownSprite.physicsBody?.contactTestBitMask = birdCategory;
    
    let pipes = SKNode();
    pipes.position = CGPoint(
      x: self.frame.size.width + pipeUpSprite.size.width,
      y: 0
    );
    pipes.zPosition = -10;
    pipes.addChild(pipeUpSprite);
    pipes.addChild(pipeDownSprite);

    // 
    // STAGE 13: Keeping score
    //
    
    let contactNode = SKNode();
    contactNode.position = CGPoint(
      x: 0,      y: self.frame.size.height / 2
    );
    contactNode.physicsBody = SKPhysicsBody(
      rectangleOf: CGSize(
        width: pipeUpSprite.size.width,
        height: self.frame.size.height
      )
    );
    contactNode.physicsBody?.isDynamic = false;
    contactNode.physicsBody?.categoryBitMask = scoreCategory;
    contactNode.physicsBody?.contactTestBitMask = birdCategory;
    
    pipes.addChild(contactNode);
    
    pipes.run(moveAndRemovePipesAction);
    
    //
    // STAGE 12: Master node
    //
    
    masterPipesNode.addChild(pipes);
    
    //addChild(pipes);
  }
  
  //
  // STAGE 11: Collision detection
  //
  
  func didBegin(_ contact: SKPhysicsContact) {
    // 
    // STAGE 13: Keeping score
    //
    
    if (
      (contact.bodyA.categoryBitMask & scoreCategory) == scoreCategory ||
      (contact.bodyB.categoryBitMask & scoreCategory) == scoreCategory
    ) {
      score = score + 1;
      scoreLabel.text = String(score);
      contact.bodyA.node?.position.y
    }
    else {
      // 
      // STAGE 14: Game over
      //
      
      gameOverLabel.isHidden = false;
      restartLabel.isHidden = false;
      
      //
      // STAGE 12: Master node
      //
      
      if (masterNode.speed > 0) {
        masterNode.speed = 0;
      }

      self.removeAction(forKey: "flash");
      
      let redBackgroundAction = SKAction.run({self.backgroundColor = SKColor.red;});
      let blackBackgroundAction = SKAction.run({self.backgroundColor = SKColor.black;});
      let delayAction = SKAction.wait(forDuration: 0.05);
      let flashAction = SKAction.sequence(
        [redBackgroundAction, delayAction, blackBackgroundAction, delayAction]
      );
      let flashRepeatAction = SKAction.repeat(flashAction, count: 4);
      
      self.run(flashRepeatAction, withKey: "flash");
    }
  }
  
  // 
  // STAGE 14: Game over
  //
  func resetScene() {
    bird.position = CGPoint(
      x: self.frame.size.width / 2,
      y: self.frame.size.height / 2
    );
    bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0);
    
    masterPipesNode.removeAllChildren();
    
    masterNode.speed = 1;
    
    score = 0;
    scoreLabel.text = String(0);
    
    gameOverLabel.isHidden = true;
    restartLabel.isHidden = true;
  }
}
