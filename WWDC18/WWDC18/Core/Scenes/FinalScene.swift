//
//  FinalScene.swift
//  WWDC18
//
//  Created by Maisa Milena on 28/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import SpriteKit

public class FinalScene: MainScene {
    
    var layer = FinalLayer()
    
    public override init(size: CGSize){
        super.init(size: size)
        
        mainLayer.tree.texture = Texture.appleTree
        
        addChild(layer)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

