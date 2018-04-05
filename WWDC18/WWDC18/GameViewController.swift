//
//  GameViewController.swift
//  WWDC18
//
//  Created by Maisa Milena on 20/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let view = self.view as! SKView? {
            //let scene = LightScene(size: Size.viewSize)
            //let scene = DarkScene(size: Size.viewSize)
            //let scene = FinalScene(size: Size.viewSize)
            let scene = InitialScene(size: Size.viewSize)
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
        }
    }
    
}
