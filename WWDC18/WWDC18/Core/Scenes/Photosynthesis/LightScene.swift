//
//  LightScene.swift
//  WWDC18
//
//  Created by Maisa Milena on 23/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import SpriteKit

public class LightScene: MainScene {
    
    // aux
    var pointsToDarkPhase = 0
    
    var layer = LightStageLayer()
    
    override public init(size: CGSize) {
        super.init(size: size)
        // Configure the properties of the scene
        name = ObjectIdentifier.lightScene
        physicsWorld.contactDelegate = self
        
        // add childs
        addChild(layer)
        
        // Notification
        NotificationCenter.default.addObserver(self, selector: #selector(goToNextScene), name: NotificationName.collisionOfLightScene, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(NotificationName.collisionOfLightScene)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Touch Events
extension LightScene {
    
    @objc private func goToNextScene(){
        print("go to next scene. \(pointsToDarkPhase)")
        if pointsToDarkPhase == 4 {
            let wait = SKAction.wait(forDuration: 0.5)
            let changeScene = SKAction.run {
                let darkScene = DarkScene(size: self.size)
                self.changeScene(nextScene: darkScene)
            }
            run(SKAction.sequence([wait, changeScene]))
        }
    }
    
}

extension LightScene: SKPhysicsContactDelegate {
    
    public func didBegin(_ contact: SKPhysicsContact) {
        // If the watering can contact with the Ocean
        if checkContact(between: ObjectIdentifier.wateringCan, and: ObjectIdentifier.ocean, contact: contact) {
            if layer.wateringCan.isEmpty {
                 layer.updateWateringCan(isEmpty: layer.wateringCan.isEmpty)
            }
        }
        
        // contact between Watering Can and Tree
        if checkContact(between: ObjectIdentifier.wateringCan, and: ObjectIdentifier.tree, contact: contact){
            if !layer.wateringCan.isEmpty{
                layer.updateWateringCan(isEmpty: layer.wateringCan.isEmpty)
                mainLayer.tree.texture = Texture.treeWater
                // this is done for only watering the tree once
                layer.wateringCan.position = Position.wateringCan
                layer.wateringCan.isUserInteractionEnabled = false
                pointsToDarkPhase += 1
                NotificationCenter.default.post(name: NotificationName.collisionOfLightScene, object: nil)
            }
        }
        
        // contact between foton and Watering Can
        if checkContact(between: ObjectIdentifier.foton, and: ObjectIdentifier.tree, contact: contact){
            let foton = checkContact(nodeWithName: ObjectIdentifier.foton, contact: contact)
            pointsToDarkPhase += 1
            foton.removeFromParent()
            NotificationCenter.default.post(name: NotificationName.collisionOfLightScene, object: nil)
        }
    }  
}







