import SpriteKit

public class LightStageLayer: SKNode {
    
    /// this object represent all the things associated with the message that appears on the screen
    let messageContent: LightStageContainer
    let ocean: Ocean
    let wateringCan: WateringCan
    
    let waterMolecule: WaterMolecule!
    
    override public init () {
        messageContent = LightStageContainer(size: Size.messageContainer)
        
        // Configure the childs
        ocean = Ocean()
        wateringCan = WateringCan(position: Position.wateringCan, texture: Texture.wateringCan)
        waterMolecule = WaterMolecule(position: CGPoint(x: Position.messageContainer.x - (Size.messageContainer.width * 0.5), y:  Position.messageContainer.y - (Size.messageContainer.height * 0.25)))
        
        super.init()
        isUserInteractionEnabled = true
        name = ObjectIdentifier.lightStageLayer
        
        // Add childs
        addChild(messageContent)
        let appear = SKAction.wait(forDuration: 7)
        let addWaterMolecule = SKAction.run {
            self.addChild(self.waterMolecule)
        }
        let sequence = SKAction.sequence([appear, addWaterMolecule])
        run(sequence)
        
        // Notification
        NotificationCenter.default.addObserver(self, selector: #selector(waterMoleculeBreaked), name: NotificationName.waterMoleculeBreaked, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(beginInteractiveStage), name: NotificationName.makePhotosynthesisInteraction, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(NotificationName.waterMoleculeBreaked)
        NotificationCenter.default.removeObserver(NotificationName.endLightPhase)
        NotificationCenter.default.removeObserver(NotificationName.makePhotosynthesisInteraction)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func updateWateringCan(isEmpty: Bool){
        // if is empty, then change the sprite and the propertie to be filled out
        if isEmpty {
            wateringCan.isEmpty = false
            wateringCan.texture = Texture.wateringCanFilledOut
        } else {
            wateringCan.isEmpty = true
            wateringCan.texture = Texture.wateringCan
        }
    }
    
}

// MARK: - Events
extension LightStageLayer {
    
    @objc private func beginInteractiveStage(){
        addChild(wateringCan)
        addChild(ocean)
        //add light particle
        let foton1 = Foton(position: CGPoint(x: Size.viewSize.width * 0.3, y: Size.viewSize.height * 0.75))
        foton1.name = ObjectIdentifier.foton
        let foton2 = Foton(position: CGPoint(x: Size.viewSize.width * 0.2, y: Size.viewSize.height * 0.7))
        foton2.name = ObjectIdentifier.foton
        let foton3 = Foton(position: CGPoint(x: Size.viewSize.width * 0.05, y: Size.viewSize.height * 0.8))
        foton3.name = ObjectIdentifier.foton
        
        addChild(foton1)
        addChild(foton2)
        addChild(foton3)
    }
    
    /// When the water molecule is breaked, then a nextButton is added. This buttons indicates the action to load the DarkScene
    @objc private func waterMoleculeBreaked(){
        // next button
        let nextButton = messageContent.nextButton
        addChild(nextButton)
        nextButton.run(Action.appear)
        // release oxygen
        let oxygen = getOxygen(position: CGPoint(x: Position.messageContainer.x , y:  Position.messageContainer.y - (Size.messageContainer.height * 0.25)))
        addChild(oxygen)
    }
    
    private func getOxygen(position: CGPoint) -> SKSpriteNode{
        let oxygen = SKSpriteNode(texture: Texture.oxygenMolecule, color: .clear, size: Texture.oxygenMolecule.size())
        oxygen.position = position
        oxygen.setScale(0.7)
        oxygen.run(Action.release)
        return oxygen
    }
    
    private func endInteractiveStage(){
        NotificationCenter.default.post(name: NotificationName.endLightPhase, object: nil)
    }
    
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        let touchLocation = touch.location(in: self)
        
        // The next button is clicked
        for node in nodes(at: touchLocation){
            if (node.name == ObjectIdentifier.nextButton) {
                NotificationCenter.default.post(name: NotificationName.makePhotosynthesisInteraction, object: nil)
                waterMolecule.removeFromParent()
            }
        }
    }
}
