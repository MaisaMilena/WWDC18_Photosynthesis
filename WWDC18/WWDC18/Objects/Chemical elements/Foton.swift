//
//  Foton.swift
//  WWDC18
//
//  Created by Maisa Milena on 25/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import SpriteKit

public class Foton: SKNode {
    
    let radius = Size.fotonRadius
        
    public init(position: CGPoint) {
        super.init()
    
        self.position = position
        isUserInteractionEnabled = true
        
        physicsBody = setupPhysicBody(radius: radius)
        zPosition = ZPosition.foton
        
        addChild(setTexture(texture: Texture.foton))        
        run(Action.clickbleAction)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPhysicBody(radius: CGFloat) -> SKPhysicsBody {
        let physicBody = SKPhysicsBody(circleOfRadius: radius)
        physicBody.affectedByGravity = false
        physicBody.categoryBitMask = CategoryBitmask.foton
        physicBody.contactTestBitMask = CategoryBitmask.tree
        physicBody.usesPreciseCollisionDetection = true
        return physicBody
    }
    
    private func setTexture(texture: SKTexture) -> SKShapeNode{
        let shape = SKShapeNode(circleOfRadius: radius)
        shape.fillColor = SKColor.white
        shape.fillTexture = texture
        shape.lineWidth = 0
        return shape
    }
    
}

extension Foton {
    
    public func startMovement (_ touchLocation: CGPoint){
        let moveAction = SKAction.move(to: touchLocation, duration: 0.02)
        self.run(moveAction)
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: parent!)
        startMovement(touchLocation)
    }
}
