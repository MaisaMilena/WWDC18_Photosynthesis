import SpriteKit

public class FinalLayer: SKNode{
    
    let messageContent: FinalStageContainer!
    
    public override init() {
        messageContent = FinalStageContainer(size: Size.messageContainer)
        super.init()
        isUserInteractionEnabled = true
        
        // add childs
        addChild(messageContent)
        //addChild(getSparkling())
        let fishs = getFish()
        for fish in fishs {
            addChild(fish)
        }
        
        // realease the oxygens in the tree and algae
        let wait = SKAction.wait(forDuration: 1)
        let release = SKAction.run {
            let oxygen = self.getOxygen(position: CGPoint(x: Position.tree.x - 60, y: Position.tree.y))
            let oxygenAlgae = self.getOxygen(position: CGPoint(x: Size.viewSize.width * 0.7, y: Size.viewSize.height * 0.1))
            oxygenAlgae.setScale(0.7)
            self.addChild(oxygenAlgae)
            self.addChild(oxygen)
        }
        let sequence = SKAction.sequence([release, wait])
        run(SKAction.repeatForever(sequence))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getFish() -> [SKSpriteNode] {
        var fishs = [SKSpriteNode]()
        let movement1: SKAction = {
            let textureRight = SKAction.setTexture(Texture.fishRight)
            let moveRight = SKAction.moveBy(x: 60, y: -10, duration: 3)
            let textureLeft = SKAction.setTexture(Texture.fishLeft)
            let moveLeft = SKAction.moveBy(x: -60, y: 10, duration: 1.3)
            let sequence = SKAction.sequence([textureRight, moveRight, textureLeft, moveLeft])
            return SKAction.repeatForever(sequence)
        }()
        let movement2: SKAction = {
            let textureRight = SKAction.setTexture(Texture.fishRight)
            let moveRight = SKAction.moveBy(x: 50, y: 13, duration: 2.5)
            let textureLeft = SKAction.setTexture(Texture.fishLeft)
            let moveLeft = SKAction.moveBy(x: -50, y: -13, duration: 1.7)
            let sequence = SKAction.sequence([textureRight, moveRight, textureLeft, moveLeft])
            return SKAction.repeatForever(sequence)
        }()
        
        let fish = SKSpriteNode(texture: Texture.fishRight)
        fish.position = CGPoint(x: Size.viewSize.width * 0.88, y: Size.viewSize.height * 0.1)
        fish.run(movement1)
        
        let fish2 = SKSpriteNode(texture: Texture.fishLeft)
        fish2.position = CGPoint(x: Size.viewSize.width * 0.8, y: Size.viewSize.height * 0.16)
        fish2.run(movement2)
        
        fishs.append(fish)
        fishs.append(fish2)
        return fishs
    }
    
    // get the emitter of sparkling action
    private func getSparkling() -> SKEmitterNode{
        var emitter = SKEmitterNode()
        if let path = Bundle.main.path(forResource: "Sparkling", ofType: "sks") {
            emitter = NSKeyedUnarchiver.unarchiveObject(withFile: path) as! SKEmitterNode
            
            emitter.position = Position.sun
            emitter.zPosition = 1
            emitter.targetNode = self.scene
            
            let wait = SKAction.wait(forDuration: 2)
            let removeElement = SKAction.run {
                emitter.removeFromParent()
            }
            let sequence = SKAction.sequence([wait, removeElement])
            run(sequence)
        } else {
            print("path of emitter not found")
        }
        
        return emitter
    }
    
    // get a new oxygen element
    private func getOxygen(position: CGPoint) -> SKSpriteNode {
        let oxygen = SKSpriteNode(texture: Texture.oxygenMolecule, color: .clear, size: Texture.oxygenMolecule.size())
        let xPosition: CGFloat = CGFloat((arc4random_uniform(10) + 6) * 10)
        //oxygen.position = CGPoint(x: (Position.tree.x - 60) + xPosition, y: Position.tree.y)
        oxygen.position = CGPoint(x: position.x + xPosition, y: position.y)
        oxygen.setScale(0.7)
        oxygen.run(Action.release)
        
        return oxygen
    }
    
}
