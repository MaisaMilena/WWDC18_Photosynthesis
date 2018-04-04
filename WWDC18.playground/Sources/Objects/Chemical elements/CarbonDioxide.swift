import SpriteKit

public class CarbonDioxide : GameObject {
    
    public init(position: CGPoint) {
        super.init(position: position, texture: Texture.carbonDioxide)
        isUserInteractionEnabled = true
        name = ObjectIdentifier.carbonDioxide
        physicsBody = setupPhysicBody(objectSize: Texture.carbonDioxide.size())
        zPosition = ZPosition.carbonDioxide
        run(Action.clickbleAction)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func setupPhysicBody(objectSize: CGSize) -> SKPhysicsBody {
        let physicBody = super.setupPhysicBody(objectSize: objectSize)
        physicBody.categoryBitMask = CategoryBitmask.carbonDioxide
        physicBody.contactTestBitMask = CategoryBitmask.tree
        physicBody.usesPreciseCollisionDetection = true
        return physicBody
    }
}

extension CarbonDioxide {
    
    public func startMovement (_ touchLocation: CGPoint){
        let moveAction = SKAction.move(to: touchLocation, duration: 0.02)
        self.run(moveAction)
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: parent!)
        startMovement(touchLocation)
    }
}
