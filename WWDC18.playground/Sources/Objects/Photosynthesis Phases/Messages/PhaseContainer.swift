import SpriteKit

// A base container for the messages that will apper explaining the 2 phases of photosynthesis: LightPhase and DarkPhase
public class PhaseContainer: SKNode, InformativeContainer {
    
    public var background: SKSpriteNode?
    // it will be defined in the child
    public var title: SKLabelNode?
    public var message: [SKLabelNode]?
    //
    
    // Reference positions
    let xPosition: CGFloat = -((Size.messageContainer.width/2) * 0.9)
    let yPosition: CGFloat = ((Size.messageContainer.height/2) * 0.7)
    
    var size: CGSize!
    
    let nextButton: SKSpriteNode = {
        let nextButton = SKSpriteNode(texture: Texture.nextButton, color: .clear, size: Texture.nextButton.size())
        nextButton.name = ObjectIdentifier.nextButton
        nextButton.position = CGPoint(x: Size.viewSize.width * 0.92, y: Size.viewSize.height * 0.5)
        return nextButton
    }()
    
    
    /**
     Creates the area for the LightStageContainer to appear
     - parameter position: indicates which point of the screen it will iniciate th drawing of the rectangle
     - parameter size: what is the size of the drawing? It means the height and widht
     */
    public init (size: CGSize) {
        super.init()
        self.size = size
        zPosition = ZPosition.messageContainer
        self.background = setBackground(size: size, position: position)
        isUserInteractionEnabled = false
        position = Position.messageContainer
        
        // adding chils
        addChild(background!)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBackground(size: CGSize, position: CGPoint) -> SKSpriteNode{
        let whiteWithAlpha = UIColor.white.withAlphaComponent(0.5)
        let background = SKSpriteNode(color: whiteWithAlpha, size: size)
        background.position = position
        return background
    }
    
    // MARK: - called in the childs
    public func setTitle(title: String, position: CGPoint) -> SKLabelNode {
        let label = SKLabelNode(text: title)
        label.position = position
        label.fontSize = Font.titleSize
        label.fontColor = Font.color
        // the alingment is
        return label
    }
    
    public func setMessage(message: String, position: CGPoint) -> SKLabelNode {
        let label = SKLabelNode(text: message)
        label.position = position
        label.fontSize = Font.messageSize
        label.fontColor = Font.color
        label.horizontalAlignmentMode = .left
        label.preferredMaxLayoutWidth = size.width * 0.9
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 2
        label.verticalAlignmentMode = .top
        return label
    }
    
    public func getDrawing(position: CGPoint, drawing: SKTexture) -> SKSpriteNode {
        let imageLightProcess = SKSpriteNode(texture: drawing)
        imageLightProcess.position = position
        //imageLightProcess.setScale(0.8)
        //imageLightProcess.run(Action.appear)
        return imageLightProcess
    }
}
