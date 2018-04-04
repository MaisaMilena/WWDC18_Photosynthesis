//
//  DarkStageContainer.swift
//  WWDC18
//
//  Created by Maisa Milena on 28/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import SpriteKit

public class DarkStageContainer: PhaseContainer {
    
    var kelvinCycle: SKSpriteNode = SKSpriteNode()
    
    override public init(size: CGSize) {
        super.init(size: size)
        self.size = size
        
        name = ObjectIdentifier.darkStageContainer
        
        title = setTitle(title: MessageDarkPhase.title, position: CGPoint(x: xPosition, y: yPosition))
        title?.horizontalAlignmentMode = .left
        message = setMessages()
        kelvinCycle = getDrawing(position: CGPoint(x: xPosition + 180 , y: yPosition - 145), drawing: Texture.kelvinCycle)
        kelvinCycle.setScale(0.48)
        
        // Add child
        addChild(title!)
        addChild(kelvinCycle)
        for msg in message! {
            addChild(msg)
        }

    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setMessages() -> [SKLabelNode]{
        var messages = [SKLabelNode]()
        
        let intro: SKLabelNode = setMessage(message: MessageDarkPhase.intro, position: CGPoint(x: xPosition, y: yPosition - 10))
        // The messages are setted to be one above the other. To do this, it used the last message as reference of position
        let message1 = setMessage(message: MessageDarkPhase.message1, position: CGPoint(x: intro.position.x, y: intro.position.y - 20))
        let message2 = setMessage(message: MessageDarkPhase.message2, position: CGPoint(x: message1.position.x, y: message1.position.y - 20))

        messages.append(intro)
        messages.append(message1)
        messages.append(message2)
        
        return messages
    }
    
    public func beginInteractiveStageElements() {
        // to the new messages appear, the old one must be removed
        for actualMessage in message! {
            actualMessage.removeFromParent()
        }
        message?.removeAll()
        kelvinCycle.removeFromParent()
        
        let intro: SKLabelNode = setMessage(message: MessageDarkPhase.instructionTitle, position: CGPoint(x: xPosition, y: yPosition - 10))
        let message1 = setMessage(message: MessageDarkPhase.instructionTip1, position: CGPoint(x: intro.position.x, y: intro.position.y - 40))
        let message2 = setMessage(message: MessageDarkPhase.instructionTip2, position: CGPoint(x: message1.position.x, y: message1.position.y - 20))
        
        message?.append(intro)
        message?.append(message1)
        message?.append(message2)
        
        nextButton.removeFromParent()
        for msg in message! {
            addChild(msg)
            msg.run(Action.appear)
        }
        
        let drawing = getDrawing(position: CGPoint(x: message1.position.x + 280, y: message1.position.y - 60), drawing: Texture.drawingDarkPhase)
        addChild(drawing)

    } 
}
