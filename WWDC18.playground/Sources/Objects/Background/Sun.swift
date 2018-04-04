import SpriteKit

public class Sun: GameObject {
    
    public init(position: CGPoint) {
        super.init(position: position, texture: Texture.sun)
        name = ObjectIdentifier.sun
        physicsBody = setupPhysicBody(objectSize: Texture.sun.size())
        physicsBody?.isDynamic = false
        run(Action.moveUpAndDown)      
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
