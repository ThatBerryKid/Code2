//
//  GameScene.swift
//  Pong
//
//  Created by James Berry on 3/3/17.
//  Copyright © 2017 James Berry. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var player: SKSpriteNode?
    var score = 0
    var label:  SKLabelNode?
    
    override func didMove(to view: SKView) {
        player = self.childNode(withName: "player") as! SKSpriteNode?
        label  = self.childNode(withName: "score") as! SKLabelNode?
        
        label?.text = "Score: \(score)"

            }
    
    
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let scene = SKScene(fileNamed: "GameOver")
//            // Set the scale mode to scale to fit the window
//            scene?.scaleMode = .aspectFill
//            
//            // Present the scene
//            view?.presentScene(scene)

    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches{
            
            player?.position.x = t.location(in: self).x
            
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        if ( contact.bodyB.contactTestBitMask == 5){
            let scene = SKScene(fileNamed: "GameOver")
                        // Set the scale mode to scale to fit the window
                        scene?.scaleMode = .aspectFill
            
                        // Present the scene
                        view?.presentScene(scene)
        }
        

    }
    
 
    
    }
