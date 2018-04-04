//
//  Ocean.swift
//  WWDC18
//
//  Created by Maisa Milena on 23/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import SpriteKit

public class Ocean: SKNode {
    
    override init() {
        super.init()
        name = ObjectIdentifier.ocean
        physicsBody = setupPhysicBody(shape: Texture.ocean)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPhysicBody(shape: CGRect) -> SKPhysicsBody {
        let physicBody = SKPhysicsBody(edgeLoopFrom: shape)
        physicBody.affectedByGravity = false
        physicBody.categoryBitMask = CategoryBitmask.ocean
        physicBody.isDynamic = false
        return physicBody
    }   
}
