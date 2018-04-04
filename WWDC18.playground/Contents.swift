import PlaygroundSupport
import SpriteKit

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: Size.viewSize.width, height: Size.viewSize.height))
let scene = InitialScene(size: sceneView.bounds.size)

sceneView.presentScene(scene)
PlaygroundPage.current.liveView = sceneView


