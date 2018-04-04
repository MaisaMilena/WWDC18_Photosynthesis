//
//  DarkStageLayer.swift
//  WWDC18
//
//  Created by Maisa Milena on 27/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import SpriteKit

public class DarkStageLayer: SKNode  {
    
    let messageContent: DarkStageContainer
    
    public override init() {
        
        messageContent = DarkStageContainer(size: Size.messageContainer)
        super.init()
        
        isUserInteractionEnabled = true
        name = ObjectIdentifier.darkStageLayer
        
        // Add childs
        let appear = SKAction.wait(forDuration: 10)
        let addWaterMolecule = SKAction.run {
            let nextButton = self.messageContent.nextButton
            self.addChild(nextButton)
            nextButton.run(Action.appear)
        }
        let sequence = SKAction.sequence([appear, addWaterMolecule])
        run(sequence)
        
        
       // addChild(nextButton)
        
        addChild(messageContent)
        
        setupClouds()
        addChild(setDarkFilter())
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupClouds(){
        let moveToSun = SKAction.moveTo(x: Position.sun.x - 10, duration: 3)
        let moveTo = SKAction.moveTo(x: Position.sun.x + 50, duration: 3)
        
        let cloudToTheSun = SKSpriteNode(texture: Texture.cloud, color: .clear, size: Texture.cloud.size())
        cloudToTheSun.position = CGPoint(x: Position.sun.x - 100, y: Position.sun.y)
        cloudToTheSun.zPosition = ZPosition.cloud
        let cloud = SKSpriteNode(texture: Texture.cloud, color: .clear, size: Texture.cloud.size())
        cloud.position = CGPoint(x: Position.sun.x - 100, y: Position.sun.y - 80)
        cloud.zPosition = ZPosition.cloud
        
        cloudToTheSun.run(moveToSun)
        cloudToTheSun.run(Action.moveUpAndDown)
        cloud.run(moveTo)
        cloud.run(Action.moveUpAndDown)
        addChild(cloudToTheSun)
        addChild(cloud)
    }
    
    private func setDarkFilter() -> SKShapeNode {
        let node = SKShapeNode(rectOf: Size.viewSize)
        node.fillColor = SKColor.black.withAlphaComponent(0.2)
        node.lineWidth = 0
        node.position = CGPoint(x: Size.viewSize.width/2, y: Size.viewSize.height/2)
        return node
    }
}

// MARK: - Events
extension DarkStageLayer {
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        // The next button is clicked
        for node in nodes(at: touchLocation){
            if (node.name == ObjectIdentifier.nextButton) {
                messageContent.beginInteractiveStageElements()
                beginInteractiveStage()
            }
        }
    }
    
    private func beginInteractiveStage() {
        let carbonDioxide1 = CarbonDioxide(position: CGPoint(x: Size.viewSize.width * 0.27, y: Size.viewSize.height * 0.9))
        let carbonDioxide2 = CarbonDioxide(position: CGPoint(x: Size.viewSize.width * 0.1, y: Size.viewSize.height * 0.7))
        let carbonDioxide3 = CarbonDioxide(position: CGPoint(x: Size.viewSize.width * 0.5, y: Size.viewSize.height * 0.3))
        
        carbonDioxide1.setScale(0.6)
        carbonDioxide2.setScale(0.6)
        carbonDioxide3.setScale(0.6)
        
        addChild(carbonDioxide1)
        addChild(carbonDioxide2)
        addChild(carbonDioxide3)
    }
}





