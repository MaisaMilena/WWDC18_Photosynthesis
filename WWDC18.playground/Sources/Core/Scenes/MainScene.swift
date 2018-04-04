import SpriteKit
import AVFoundation

public class MainScene: SKScene {
    
    let mainLayer: MainLayer
    
    override public init(size: CGSize) {
        mainLayer = MainLayer()
        super.init(size: size)
        
        setupProperties(frame: frame.size)
        
        if !(AudioManager.instance.audio?.isPlaying)! {
            AudioManager.instance.audio?.play()
        }
        
        // add childs
        addChild(mainLayer)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProperties (frame: CGSize) {
        // the gravity pulls the body up
        physicsWorld.gravity = CGVector(dx: 0, dy: -10)
        scaleMode = .aspectFit
    }
    
    // Loads a new scene
    public func changeScene(nextScene: SKScene){
        nextScene.scaleMode = SKSceneScaleMode.aspectFill
        scene?.view?.presentScene(nextScene)
    }
    
    public func checkContact(between bodyA: String, and bodyB: String, contact: SKPhysicsContact) -> Bool {
        if ((contact.bodyB.node?.name == bodyB && contact.bodyA.node?.name == bodyA)
            || (contact.bodyB.node?.name == bodyA && contact.bodyA.node?.name == bodyB)){
            return true
        } else {
            return false
        }
    }
    
    public func checkContact(nodeWithName name: String, contact: SKPhysicsContact) -> SKNode{
        var node: SKNode = SKNode()
        if contact.bodyB.node?.name == name {
            node = contact.bodyB.node as! SKNode
        } else if contact.bodyA.node?.name == name{
            node = contact.bodyA.node as! SKNode
        }
        return node
    }
    
}
