//
//  FinalStageContainer.swift
//  WWDC18
//
//  Created by Maisa Milena on 28/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import SpriteKit

public class FinalStageContainer: PhaseContainer{
    
    override public init(size: CGSize) {
        super.init(size: CGSize(width: size.width, height: size.height * 0.7))
        
        title = setTitle(title: MessageFinalScene.title, position: CGPoint(x: xPosition + 90, y: yPosition - 30))
        message = setMessages()
        
        // add childs
        addChild(title!)
        for msg in message! {
            addChild(msg)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /**
     Creates the position of each message in the screen
     - paramenter size: the size of the container
     */
    private func setMessages() -> [SKLabelNode]{
        var messages = [SKLabelNode]()
        
        let message1 = setMessage(message: MessageFinalScene.message1, position: CGPoint(x: xPosition, y: yPosition - 50))
        // The messages are setted to be one above the other. To do this, it used the last message as reference of position
        let message2 = setMessage(message: MessageFinalScene.message2, position: CGPoint(x: message1.position.x, y: message1.position.y - 70))
        
        messages.append(message1)
        messages.append(message2)
        
        return messages
    }
}
