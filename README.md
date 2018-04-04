# WWDC18 - Photosynthesis

![alt text](https://i.imgur.com/S4bGAIy.png)

Hi! This is my Playground project made for WWDC18 Scholarship.
Youtube demonstration: https://youtu.be/HvdIz6x3TTc

## About
I've built an educational playground to teach about a topic that I really enjoy thinking and discussing about: the things that make life possible. 
The user is responsible for making the photosynthesis process happen, it must read the content message and follow the instructions to make the actions need in each photosynthesis’ phase.

For this project, I used SpriteKit as the main framework, and AVFoundation for the sound. I designed its architecture in a way that is easy to understand, and that could be used to teach about SpriteKit. The collisions are controlled by SKScenes, which organizes the scene objects in layers, each one responsible for dealing with events that happen within, and to act accordingly (updating positions, adding and removing objects, etc.). I used SKSpriteNode for images, SKShapeNode for drawings and SKLabelNode for messages. Each object has its own set of specific features, but everything shared by multiple objects is properly abstracted in a class.

The scene and layer compositions were based in the phases of photosynthesis, representing the light and dark phases, and their respective unfolding events, in a flow that is simple and friendly to understand. 


## Screenshots

![alt text](https://i.imgur.com/BqrNuPb.png)
*Light Phase*

![alt text](https://i.imgur.com/zdMu5hB.png)
*Dark Phase*
