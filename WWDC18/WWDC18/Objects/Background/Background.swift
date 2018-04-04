//
//  Background.swift
//  WWDC18
//
//  Created by Maisa Milena on 23/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import SpriteKit

public class Background: SKSpriteNode {
    
    public init(texture: SKTexture) {
        super.init(texture: texture, color: .clear, size: texture.size())
        self.position = Position.background
        zPosition = CGFloat(ZPosition.background)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
