//
//  PhysicBody.swift
//  WWDC18
//
//  Created by Maisa Milena on 21/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import SpriteKit

public protocol PhysicBody {
    func setupPhysicBody(objectSize : CGSize) -> SKPhysicsBody
}

// A presentation of what is a MessageContainer.
// It's an object than can hold and show informatives to the user
public protocol InformativeContainer {
    var title: SKLabelNode? {get set}
    var message: [SKLabelNode]? {get set}
    var background : SKSpriteNode? {get set}
}


