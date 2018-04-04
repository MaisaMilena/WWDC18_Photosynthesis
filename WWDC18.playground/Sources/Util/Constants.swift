//
//  Constants.swift
//  WWDC18
//
//  Created by Maisa Milena on 21/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import SpriteKit

// MARK: - Image
private struct ImageName {
    public static let background = "Main scenario/Background.png"
    public static let initialBackground = "Main scenario/Background - Initial"
    public static let sun = "Main scenario/Sun"
    public static let tree = "Main scenario/Tree"
    public static let treeWater = "Main scenario/Tree water"
    public static let appleTree = "Main scenario/Apple tree"
    public static let wateringCan = "Main scenario/Watering can"
    public static let wateringCanFilledOut = "Main scenario/Watering can filled out"
    public static let fishRight = "Main scenario/Fish2"
    public static let fishLeft = "Main scenario/Fish"
    
    public static let carbonDioxide = "CO2"
    public static let oxygen = "O"
    public static let oxygenMolecule = "O2"
    public static let hydrogen = "H"
    public static let foton = "Foton"
    public static let nextButton = "Next"
    public static let cloud = "Cloud"
    
    public static let photosynthesisDrawing = "Drawing stages/PhotosynthesisDrawing"
    public static let processLight = "Drawing stages/Process - light"
    public static let processDark = "Drawing stages/Process - dark"
    public static let kelvinCycle = "Drawing stages/Kelvin Cycle"

}

public struct Texture {
    public static let background = SKTexture(imageNamed: ImageName.background)
    public static let backgroundInitial = SKTexture(imageNamed: ImageName.initialBackground)
    public static let sun = SKTexture(imageNamed: ImageName.sun)
    public static let tree = SKTexture(imageNamed: ImageName.tree)
    public static let treeWater = SKTexture(imageNamed: ImageName.treeWater)
    public static let appleTree = SKTexture(imageNamed: ImageName.appleTree)
    public static let ocean = CGRect(x: Position.ocean.x, y: Position.ocean.y, width: Size.ocean.width, height: Size.ocean.height)
    public static let wateringCan = SKTexture(imageNamed: ImageName.wateringCan)
    public static let wateringCanFilledOut = SKTexture(imageNamed: ImageName.wateringCanFilledOut)
    
    public static let carbonDioxide = SKTexture(imageNamed: ImageName.carbonDioxide)
    public static let oxygen = SKTexture(imageNamed: ImageName.oxygen)
    public static let oxygenMolecule = SKTexture(imageNamed: ImageName.oxygenMolecule)
    public static let hydrogen = SKTexture(imageNamed: ImageName.hydrogen)
    public static let foton = SKTexture(imageNamed: ImageName.foton)
    
    public static let nextButton = SKTexture(imageNamed: ImageName.nextButton)
    public static let photosynthesisDrawing = SKTexture(imageNamed: ImageName.photosynthesisDrawing)
    
    public static let drawingLightPhase = SKTexture(imageNamed: ImageName.processLight)
    public static let drawingDarkPhase = SKTexture(imageNamed: ImageName.processDark)
    public static let kelvinCycle = SKTexture(imageNamed: ImageName.kelvinCycle)
    
    public static let cloud = SKTexture(imageNamed: ImageName.cloud)
    public static let fishRight = SKTexture(imageNamed: ImageName.fishRight)
    public static let fishLeft = SKTexture(imageNamed: ImageName.fishLeft)
}

// MARK: - Presentation in the screen
public struct Position {
    // objects
    public static let sun = CGPoint(x: (Size.viewSize.width * 0.01) + Texture.sun.size().width, y: Size.viewSize.height - (Texture.sun.size().height * 0.6))
    public static let tree = CGPoint(x: Size.viewSize.width * 0.2, y: Size.viewSize.height * 0.35)
    //public static let ocean = CGPoint(x: Size.viewSize.width * 0.85, y: Size.ocean.height/2)
    public static let ocean = CGPoint(x: Size.viewSize.width * 0.75, y: 0)
    public static let wateringCan =  CGPoint(x: Size.viewSize.width * 0.5, y: Size.viewSize.height * 0.1)
    
    public static let background = CGPoint(x: Size.viewSize.width/2, y: Size.viewSize.height/2)
    public static let messageContainer = CGPoint(x: ((Size.viewSize.width - Size.messageContainer.width/2) - 20), y: ((Size.viewSize.height - Size.messageContainer.height/2) - 20))
}

public struct ZPosition {
    public static let background: CGFloat = 0.0
    public static let shadowDarkPhase: CGFloat = 2.0
    public static let messageContainer: CGFloat = 3.0
    
    public static let gameObject: CGFloat = 3.0
    //public static let wateringCan: CGFloat = 2.0
    
    public static let cloud: CGFloat = 4.0
    public static let foton: CGFloat = 4.0
    public static let carbonDioxide: CGFloat = 5.0
}

public struct Size {
    //public static let viewSize = CGSize(width: UIImage(named: ImageName.background)!.size.width, height: UIImage(named: ImageName.background)!.size.height)
    public static let viewSize = CGSize(width: 640, height: 480)
    public static let messageContainer = CGSize(width: Size.viewSize.width * 0.6, height: Size.viewSize.height * 0.5)
    
    public static let ocean = CGSize(width: Size.viewSize.width * 0.25, height: Size.viewSize.height * 0.27)
    public static let fotonRadius: CGFloat = 10
}

public struct Font {
    //public static let color = UIColor.init(red: 70/255, green: 96/255, blue: 132/255, alpha: 1)
    public static let color = UIColor.black
    public static let messageSize : CGFloat = 12.0
    public static let titleSize : CGFloat = 14.0
}

public struct Action {
    public static let appear: SKAction = {
        let increaseScale = SKAction.scale(to: 0, duration: 0)
        let decreaseScale = SKAction.scale(to: 1, duration: 1)
        return SKAction.sequence([increaseScale, decreaseScale])
    }()
    public static let release: SKAction = {
        let moveRight = SKAction.move(by: CGVector(dx: 45, dy: 40), duration: 0.5)
        let moveLeft = SKAction.move(by: CGVector(dx: -25, dy: 50), duration: 0.5)
        let sequence = SKAction.sequence([moveRight, moveLeft])
        return SKAction.repeatForever(sequence)
    }()
    public static let clickbleAction: SKAction = {
        let increaseScale = SKAction.scale(to: 1.3, duration: 1)
        let decreaseScale = SKAction.scale(to: 1, duration: 1)
        let sequence = SKAction.sequence([increaseScale, decreaseScale])
        return SKAction.repeatForever(sequence)
    }()
    public static let moveUpAndDown: SKAction = {
        let moveUp = SKAction.move(by: CGVector(dx: 0, dy: 5), duration: 2)
        let moveDown = SKAction.move(by: CGVector(dx: 0, dy: -5), duration: 2)
        let sequence = SKAction.sequence([moveUp, moveDown])
        return SKAction.repeatForever(sequence)
    }()
}

// MARK: - Identifiers
public struct ObjectIdentifier {
    public static let lightScene = "LightScene"
    public static let lightStageLayer = "LightStageLayer"
    public static let lightStageContainer = "LightStageContainer"
    
    public static let darkScene = "DarkScene"
    public static let darkStageLayer = "DarkStageLayer"
    public static let darkStageContainer = "DarkStageContainer"
    
    public static let sun = "Sun"
    public static let tree = "Tree"
    public static let ocean = "Ocean"
    public static let wateringCan = "Watering can"
    
    public static let foton = "Foton"
    public static let carbonDioxide = "Carbon dioxide"
    public static let nextButton = "NextButton"
}

public struct CategoryBitmask {
    public static let tree: UInt32 = 0b1 << 2
    public static let ocean: UInt32 = 0b1 << 4
    public static let waterinCan: UInt32 = 0b1 << 8
    public static let carbonDioxide: UInt32 = 0b1 << 16
    public static let foton: UInt32 = 0b1 << 32
}

// MARK: - Notification
public struct NotificationName {
    // light phase
    public static let waterMoleculeBreaked = NSNotification.Name("wwdc18WaterMoleculeBreaked")
    public static let makePhotosynthesisInteraction = NSNotification.Name("wwdc18MakePhotosynthesisInteraction")
    public static let endLightPhase = NSNotification.Name("wwdc18EndLightPhase")
    public static let collisionOfLightScene = NSNotification.Name("wwdc18collisionOfLightScene")
    public static let collisionOfDarkScene = NSNotification.Name("wwdc18collisionOfDarkScene")
}

