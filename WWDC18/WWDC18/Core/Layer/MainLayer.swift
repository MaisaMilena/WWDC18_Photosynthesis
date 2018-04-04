//
//  MainLayer.swift
//  WWDC18
//
//  Created by Maisa Milena on 24/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import SpriteKit
import AVFoundation

public class MainLayer: SKNode {

    let sun: SKSpriteNode!
    var background = Background(texture: Texture.background)
    let tree: Tree
    var audio: SKAudioNode!
    
    override public init() {
        sun = Sun(position: Position.sun)
        tree = Tree(position: Position.tree)     
        
        super.init()
        // add child
        addChild(sun)
        addChild(background)
        addChild(tree)
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension MainLayer {

    public func moveNode (_ touchLocation: CGPoint) -> SKAction{
        return SKAction.move(to: touchLocation, duration: 0.05)
    }
    
}
