//
//  menu.swift
//  Pong
//
//  Created by James Berry on 3/3/17.
//  Copyright © 2017 James Berry. All rights reserved.
//

import SpriteKit
import GameplayKit


class menu: SKScene {
   
    var label:  SKLabelNode?
    var labe2:  SKLabelNode?
    var score = 0
    var highScore = 0;
    override func didMove(to view: SKView) {
        
        label  = self.childNode(withName: "LabelLastScore") as! SKLabelNode?
        labe2  = self.childNode(withName: "LabelHighScore") as! SKLabelNode?
        
        label?.text = "Last Score: \(score)"
        labe2?.text = "High Score: \(highScore)"
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let scene = SKScene(fileNamed: "GameScene")
        // Set the scale mode to scale to fit the window
        scene?.scaleMode = .aspectFill
        
        // Present the scene
        view?.presentScene(scene)
        
    }
    
    
    
}
