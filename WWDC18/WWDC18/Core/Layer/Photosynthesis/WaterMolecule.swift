//
//  WaterMolecule.swift
//  WWDC18
//
//  Created by Maisa Milena on 25/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import SpriteKit

public class WaterMolecule: SKNode  {
    
    let size = CGSize(width: Size.messageContainer.width * 0.4, height: Size.messageContainer.height * 0.2)
    var waterMolecule: SKShapeNode?
    var hydrogenLeft: GameObject!
    var hydrogenRight: GameObject!
    
    var forceCounter = 0
    
    public init(position: CGPoint){
        
        super.init()
        self.position = position
        isUserInteractionEnabled = true
        waterMolecule = setWaterMolecule(size: size)
        
        addChild(waterMolecule!)
        waterMolecule?.run(clickbleAction())
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
     This actions is different from the other elements actions, that's because it's not using the Action.clickable
     */
    private func clickbleAction() -> SKAction {
        let increaseScale = SKAction.scale(to: 1.03, duration: 1)
        let decreaseScale = SKAction.scale(to: 1, duration: 1)
        let sequence = SKAction.sequence([increaseScale, decreaseScale])
        return SKAction.repeatForever(sequence)
    }
    
    // will put the elements together
    private func setWaterMolecule(size: CGSize) -> SKShapeNode{
        let shape = SKShapeNode(rect: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        //shape.fillColor = SKColor.green.withAlphaComponent(0.3)
        //shape.lineWidth = 0
        let oxygen = GameObject(position: CGPoint(x: size.width/2, y: size.height/2), texture: Texture.oxygen)
        oxygen.setScale(0.7)
        hydrogenLeft = GameObject(position: CGPoint(x: oxygen.position.x + (oxygen.size.width * 0.9), y: oxygen.position.y - (oxygen.size.height * 0.5)), texture: Texture.hydrogen)
        hydrogenLeft.setScale(0.7)
        hydrogenRight = GameObject(position: CGPoint(x: oxygen.position.x - (oxygen.size.width * 0.9), y: oxygen.position.y - (oxygen.size.height * 0.5)), texture: Texture.hydrogen)
        hydrogenRight.setScale(0.7)
        
        shape.lineWidth = 0
        shape.addChild(oxygen)
        shape.addChild(hydrogenLeft)
        shape.addChild(hydrogenRight)
        
        return shape
    }
    
}

extension WaterMolecule {
    
    // The user with click on the molecule, when the molecule is clicked 5 times, its breaked and ends the interaction.
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if forceCounter == 5 {
            isUserInteractionEnabled = false
            NotificationCenter.default.post(name: NotificationName.waterMoleculeBreaked, object: nil)
            waterMolecule?.removeAllActions()
            hydrogenRight.position.x -= 20
            hydrogenLeft.position.x += 20  
        } else {
            hydrogenRight.position.x -= 1
            hydrogenLeft.position.x += 1
            forceCounter += 1
        }
    }
    
}





