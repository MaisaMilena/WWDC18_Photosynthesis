//
//  InitialScene.swift
//  WWDC18
//
//  Created by Maisa Milena on 29/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import SpriteKit

public class InitialScene: SKScene {
    
    var layer = InitialLayer()
    var nextScene: LightScene?
    
    public override init(size: CGSize){
        super.init(size: size)
        addChild(layer)      
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension InitialScene {
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        // The next button is clicked go to LightScene
        for node in nodes(at: touchLocation){
            if (node.name == ObjectIdentifier.nextButton) {
                nextScene = LightScene(size: self.size)
                changeScene(nextScene: nextScene!)
            }
        }
    }
    
    // Loads a new scene
    private func changeScene(nextScene: SKScene){
        nextScene.scaleMode = SKSceneScaleMode.aspectFill
        scene?.view?.presentScene(nextScene)
    }
}



