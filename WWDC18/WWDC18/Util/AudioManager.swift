//
//  AudioManager.swift
//  WWDC18
//
//  Created by Maisa Milena on 30/03/2018.
//  Copyright © 2018 Maisa Milena. All rights reserved.
//

import AVFoundation

class AudioManager{
    
    static let instance = AudioManager()
    var audio: AVAudioPlayer?
    
    private init() {
        if let musicURL = Bundle.main.url(forResource: "BackgroundMusic", withExtension: "m4a") {
            do {
                audio = try AVAudioPlayer(contentsOf: musicURL)
            } catch _{
                audio = nil
            }
            audio?.volume = 0.75
            audio?.numberOfLoops = 50
            audio?.play()
        } else {
            print("audio file not found")
        }
    }
}
