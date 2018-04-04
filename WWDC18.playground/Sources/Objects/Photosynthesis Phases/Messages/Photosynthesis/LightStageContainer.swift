import Foundation

import SpriteKit

public class LightStageContainer: PhaseContainer{
    
    override public init(size: CGSize) {
        
        // calls the Super Class (PhaseMessageContainer) to deal the basic things so this class only deals with the custom properties as setting the messages :)
        super.init(size: size)
        self.size = size
        name = ObjectIdentifier.lightStageContainer
        
        title = setTitle(title: MessageLightPhase.title, position: CGPoint(x: xPosition + 80, y: yPosition))
        message = setMessages()
        
        // Add child
        addChild(title!)
        for msg in message! {
            addChild(msg)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(beginInteractiveStageElements), name: NotificationName.makePhotosynthesisInteraction, object: nil)
        
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
        
        let intro: SKLabelNode = setMessage(message: MessageLightPhase.intro, position: CGPoint(x: xPosition, y: yPosition - 10))
        // The messages are setted to be one above the other. To do this, it used the last message as reference of position
        let message1 = setMessage(message: MessageLightPhase.message1, position: CGPoint(x: intro.position.x, y: intro.position.y - 40))
        let instruction = setMessage(message: MessageLightPhase.instructionWaterMolecule, position: CGPoint(x: message1.position.x, y: message1.position.y - 40))
        let message2 = setMessage(message: MessageLightPhase.message2, position: CGPoint(x: message1.position.x, y: message1.position.y - 100))
        
        messages.append(intro)
        messages.append(message1)
        messages.append(instruction)
        messages.append(message2)
        
        for msg in messages {
            msg.run(Action.appear)
        }
        
        return messages
    }
    /**
     After the introduction, is time for the user to interact and help in the photosynthesis' process
     In this second stage, the messages with me changed for instructions
     */
    @objc private func beginInteractiveStageElements() {
        // to the new messages appear, the old one must be removed
        for actualMessage in message! {
            actualMessage.removeFromParent()
        }
        message?.removeAll()
        
        let intro: SKLabelNode = setMessage(message: MessageLightPhase.instructionTitle, position: CGPoint(x: xPosition, y: yPosition - 10))
        let message1 = setMessage(message: MessageLightPhase.instructionTip1, position: CGPoint(x: intro.position.x, y: intro.position.y - 40))
        let message2 = setMessage(message: MessageLightPhase.instructionTip2, position: CGPoint(x: message1.position.x, y: message1.position.y - 20))
        
        message?.append(intro)
        message?.append(message1)
        message?.append(message2)
        
        nextButton.removeFromParent()
        for msg in message! {
            addChild(msg)
            msg.run(Action.appear)
        }
        
        let drawing = getDrawing(position: CGPoint(x: message1.position.x + 280, y: message1.position.y - 60), drawing: Texture.drawingLightPhase)
        drawing.setScale(0.8)
        addChild(drawing)
    }
    
}
