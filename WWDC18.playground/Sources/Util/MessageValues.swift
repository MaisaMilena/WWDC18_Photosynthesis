import Foundation

public struct MessageInitial {
    public static let why = "The photosynthesis produces the oxygen that we breathe and gives the base for the major part of food chain."
    public static let what = "It's a process in which plants, algae and some bacterias utilize solar energy to produce organic material and oxygen."
    public static let how = "This drawing shows in simplicity how this process occurs:"
    public static let question = "Have you ever thought how important this process is? Let's see how it works! =)"
}


public struct MessageLightPhase {
    // Introduction do Light Phase
    public static let title = "Light phase (photochemical)"
    public static let intro = "The first step of the photosynthesis uses the solar energy to generate ATP and NADPH. It's divided in two stages:"
    public static let message1 = "1- Photolysis of water: breaks the water molecule and produces the oxygen that is released in the atmosphere"
    public static let instructionWaterMolecule = "* Click on the water molecule until you break it *"
    public static let message2 = "2- Photophosphorylation: makes ATP and NADPH. Ocurres in the thylakoid, which stays in the chloroplasts"
    
    // User Interaction
    public static let instructionTitle = "The photosynthesis' process initiates with water and solar light (has photon particles). Let's help the tree receive it!"
    public static let instructionTip1 = "1- fill the watering can with water"
    public static let instructionTip2 = "2- the sun released photon particles"
    
}

public struct MessageDarkPhase {
    // Introduction do Dark Phase
    public static let title = "Dark phase (chemical)"
    public static let intro = "In this phase, the light is not necessary. "
    public static let message1 = "> Occurs in the stroma (inner space of chloroplasts)"
    public static let message2 = "> Receives the ATP and NADPH that were produced in the Light Phase, together with CO2 (carbon dioxide), to synthesize sugars (carbohydrate, glucose, sucrose)"
    
    // User interaction
    public static let instructionTitle = "In this stage ocurres the Calvin Cycle. Carbon atoms from CO2 are fixed (incorporated into organic molecules) and used to build sugars."
    public static let instructionTip1 = "1- CO2 is needed to initiate this cycle."
    public static let instructionTip2 = "2- the atmosphere has CO2"
    
}

// Ending scene
public struct MessageFinalScene {
    public static let title = "The photosynthesis is completed!"
    public static let message1 = "Could you notice how simple this fundamental process is? There are so many essential things on nature without which life on Earth would not be possible!"
    public static let message2 = "I'd like to invite you to take a moment and think about the things you can do to thank the planet and the nature for being so amazing to us! =)"
}
