import SpriteKit

public class Background: SKSpriteNode {
    
    public init(texture: SKTexture) {
        super.init(texture: texture, color: .clear, size: texture.size())
        self.position = Position.background
        size = Size.viewSize
        zPosition = CGFloat(ZPosition.background)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
