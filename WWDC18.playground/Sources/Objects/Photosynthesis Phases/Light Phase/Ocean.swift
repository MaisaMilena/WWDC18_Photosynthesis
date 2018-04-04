import SpriteKit

public class Ocean: SKNode {
    
    override init() {
        super.init()
        name = ObjectIdentifier.ocean
        physicsBody = setupPhysicBody(shape: Texture.ocean)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPhysicBody(shape: CGRect) -> SKPhysicsBody {
        let physicBody = SKPhysicsBody(edgeLoopFrom: shape)
        physicBody.affectedByGravity = false
        physicBody.categoryBitMask = CategoryBitmask.ocean
        physicBody.isDynamic = false
        return physicBody
    }
}
