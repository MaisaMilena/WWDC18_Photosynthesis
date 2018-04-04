//
//  Watercan.swift
//  WWDC18
//
//  Created by Maisa Milena on 24/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import SpriteKit

public class WateringCan: GameObject {
    
    var isEmpty: Bool = true
    
    override public init(position: CGPoint, texture: SKTexture) {
        super.init(position: position, texture: texture)
        name = ObjectIdentifier.wateringCan
        isUserInteractionEnabled = true
        
        physicsBody = setupPhysicBody(objectSize: texture.size())
        run(clickbleAction)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func setupPhysicBody(objectSize: CGSize) -> SKPhysicsBody {
        let physicBody = super.setupPhysicBody(objectSize: objectSize)
        physicBody.categoryBitMask = CategoryBitmask.waterinCan
        physicBody.contactTestBitMask = CategoryBitmask.ocean | CategoryBitmask.tree
        return physicBody
    }
    
}

extension WateringCan {
    
    public func startMovement (_ touchLocation: CGPoint){
        let moveAction = SKAction.move(to: touchLocation, duration: 0.05)
        self.run(moveAction)
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: parent!)
        startMovement(touchLocation)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        position = Position.wateringCan
    }
}

