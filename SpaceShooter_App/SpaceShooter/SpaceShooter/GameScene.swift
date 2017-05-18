//
//  GameScene.swift
//  SpaceShooter
//
//  Created by newschool on 2/6/17.
//  Copyright © 2017 James Berry. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var score = 0
    let scoreGoal = 150
    var scoreBest = 0
    
    var lazerSpeed = 700;
    
    //Properties must be "?"
    var player: SKSpriteNode? //Optional, "null"
    var boss:   SKSpriteNode?
    var lazer:  SKShapeNode?
    var label:  SKLabelNode?
    
    
    //setup, first thing to get called, App Called
    override func didMove(to view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        
        player = self.childNode(withName: "player") as! SKSpriteNode?
        boss   = self.childNode(withName: "boss") as! SKSpriteNode?
        label  = self.childNode(withName: "myLabel") as! SKLabelNode?
        
        label?.text = "Shots Hit: \(score)"
    
    
    }
    
    func  updateLabel(){
        label?.text = "Shots Hit: \(score)"
        
        if score >= 300 {
            label?.text = "Shots Hit: YOU WON!"
        }
        if score == -10{
            label?.text = "OH NO! You Lost!"
        }
    }
    
    
    func makeLazer(){
        lazer  = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 10, height: 30))
        lazer?.fillColor = UIColor.init(hue: 130, saturation: 255, brightness: 100, alpha: 50)
        lazer?.position = (player?.position)!
        lazer?.physicsBody = SKPhysicsBody(rectangleOf: (lazer?.frame.size)!)
        lazer?.physicsBody?.affectedByGravity = false
        lazer?.physicsBody?.velocity = CGVector(dx: 0, dy: lazerSpeed)
        lazer?.physicsBody?.contactTestBitMask = 2
        self.addChild(lazer!)
        
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        
        makeLazer()
        for t in touches{
            
            player?.position = t.location(in: self)
            
            
        }
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

        makeLazer()
        for t in touches{
            
            player?.position = t.location(in: self)
            
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
       
        
        if(contact.bodyA.contactTestBitMask == 1){
        score = score+1
        updateLabel()
        }
        if (contact.bodyA.contactTestBitMask == 1 && contact.bodyB.contactTestBitMask == 2){
            contact.bodyB.node?.removeFromParent()
        }else if (contact.bodyB.contactTestBitMask == 3){
            score = -10
            updateLabel()
        }
        if(contact.bodyA.contactTestBitMask == 4 && contact.bodyB.contactTestBitMask==2){
            contact.bodyB.node?.removeFromParent()
        }
        
    }

}
