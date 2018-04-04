import SpriteKit

public class Tree: GameObject {
    
    public init(position: CGPoint) {
        super.init(position: position, texture: Texture.tree)
        name = ObjectIdentifier.tree
        physicsBody = setupPhysicBody(objectSize: Texture.tree.size())
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func setupPhysicBody(objectSize: CGSize) -> SKPhysicsBody {
        let physicBody = SKPhysicsBody.init(texture: Texture.tree, size: Texture.tree.size())
        physicBody.affectedByGravity = false
        physicBody.categoryBitMask = CategoryBitmask.tree
        physicBody.isDynamic = false
        return physicBody
    }
}
