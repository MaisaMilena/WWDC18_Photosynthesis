import SpriteKit

// A main object for commom proprerties of GameObjects
public class GameObject: SKSpriteNode, PhysicBody {
    
    let clickbleAction: SKAction = {
        let increaseScale = SKAction.scale(to: 1.05, duration: 1)
        let decreaseScale = SKAction.scale(to: 1, duration: 1)
        let sequence = SKAction.sequence([increaseScale, decreaseScale])
        return SKAction.repeatForever(sequence)
    }()
    
    public init(position: CGPoint, texture: SKTexture) {
        super.init(texture: texture, color: .clear, size: texture.size())
        texture.filteringMode = .nearest
        self.position = position
        zPosition = ZPosition.gameObject
    }
    
    required public init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    // the default body is a circle
    public func setupPhysicBody(objectSize: CGSize) -> SKPhysicsBody {
        let body = SKPhysicsBody(circleOfRadius: max(size.width / 2, size.height / 2))
        body.affectedByGravity = false
        return body
    }
    
}
