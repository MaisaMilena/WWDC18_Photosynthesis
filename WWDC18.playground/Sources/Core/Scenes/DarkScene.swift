import Foundation

import SpriteKit

public class DarkScene: MainScene {
    
    // aux
    var pointsToTheEnd = 0
    
    var layer = DarkStageLayer()
    
    override public init(size: CGSize) {
        super.init(size: size)
        // Configure the properties of the scene
        name = ObjectIdentifier.darkScene
        physicsWorld.contactDelegate = self
        
        // add childs
        addChild(layer)
        
        // Notification
        NotificationCenter.default.addObserver(self, selector: #selector(goToNextScene), name: NotificationName.collisionOfDarkScene, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(NotificationName.collisionOfDarkScene)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: - Events
extension DarkScene {

    @objc private func goToNextScene(){
        if pointsToTheEnd == 3 {
            let wait = SKAction.wait(forDuration: 0.5)
            let changeScene = SKAction.run {
                let finalScene = FinalScene(size: self.size)
                self.changeScene(nextScene: finalScene)
            }
            run(SKAction.sequence([wait, changeScene]))
        }
    }
    
}

extension DarkScene: SKPhysicsContactDelegate {
    
    public func didBegin(_ contact: SKPhysicsContact) {
        if checkContact(between: ObjectIdentifier.carbonDioxide, and: ObjectIdentifier.tree, contact: contact) {
            let carbon = checkContact(nodeWithName: ObjectIdentifier.carbonDioxide, contact: contact)
            pointsToTheEnd += 1
            carbon.removeFromParent()
            NotificationCenter.default.post(name: NotificationName.collisionOfDarkScene, object: nil)
        }
    }
}
