import SpriteKit

public protocol PhysicBody {
    func setupPhysicBody(objectSize : CGSize) -> SKPhysicsBody
}

// A presentation of what is a MessageContainer.
// It's an object than can hold and show informatives to the user
public protocol InformativeContainer {
    var title: SKLabelNode? {get set}
    var message: [SKLabelNode]? {get set}
    var background : SKSpriteNode? {get set}
}

