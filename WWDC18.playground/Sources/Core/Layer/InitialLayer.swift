import SpriteKit

public class InitialLayer: SKNode {
    
    let size: CGSize!
    let background = Background(texture: Texture.backgroundInitial)
    let nextButton: SKSpriteNode = {
        let nextButton = SKSpriteNode(texture: Texture.nextButton, color: .clear, size: Texture.nextButton.size())
        //nextButton.setScale(2)
        nextButton.name = ObjectIdentifier.nextButton
        nextButton.position = CGPoint(x: Size.viewSize.width * 0.92, y: Size.viewSize.height * 0.1)
        return nextButton
    }()
    
    let xPosition = Size.viewSize.width * 0.1
    
    public init(size: CGSize) {
        self.size = size
        super.init()
        
        let image = SKSpriteNode(texture: Texture.photosynthesisDrawing)
        image.position = CGPoint(x: Size.viewSize.width * 0.5, y: Size.viewSize.height * 0.4)
        image.run(Action.appear)

        // Adding childrens
        addChild(background)
        addChild(image)
        for msg in configureMessages() {
            addChild(msg)
        }
        
        // After a time, add the next button
        let appear = SKAction.wait(forDuration: 10)
        let addElements = SKAction.run {
            let question = self.setMessage(message: MessageInitial.question, position: CGPoint(x: self.xPosition, y: Size.viewSize.height * 0.2))
            question.run(Action.appear)
            self.addChild(question)
            self.addChild(self.nextButton)
        }
        let sequence = SKAction.sequence([appear, addElements])
        run(sequence)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureMessages() -> [SKLabelNode]{
        var messages = [SKLabelNode]()
        let why = setMessage(message: MessageInitial.why, position: CGPoint(x: xPosition, y: size.height * 0.9))
        why.run(Action.appear)
        let what = setMessage(message: MessageInitial.what, position: CGPoint(x: xPosition, y: why.position.y - 60))
        what.run(Action.appear)
        let how = setMessage(message: MessageInitial.how, position: CGPoint(x: xPosition, y: what.position.y - 50))
        how.run(Action.appear)
        
        messages.append(why)
        messages.append(what)
        messages.append(how)
        
        return messages
    }
    
    /**
     All messages has common properties, here is where it is setted
     */
    private func setMessage(message: String, position: CGPoint) -> SKLabelNode {
        let label = SKLabelNode(text: message)
        label.position = position
        label.fontSize = Font.messageSize + 4
        label.fontColor = Font.color
        label.horizontalAlignmentMode = .left
        label.preferredMaxLayoutWidth = Size.viewSize.width * 0.8
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        label.verticalAlignmentMode = .top
        label.setScale(4)
        return label
    }
    
}
