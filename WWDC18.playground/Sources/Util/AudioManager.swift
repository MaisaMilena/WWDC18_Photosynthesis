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
