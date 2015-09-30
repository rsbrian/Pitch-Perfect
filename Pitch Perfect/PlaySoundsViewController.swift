//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by rsbrian on 2015/9/23.
//  Copyright © 2015年 rsbrian. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    
    // Step 1: Create AVAudioEngine variable globally
    var audioEngine:AVAudioEngine!
    var audioFile: AVAudioFile!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlayer = try! AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        audioPlayer.enableRate = true
        
        // Step 2: Create a instance of AVAudioEngine
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playFastAudio(sender: UIButton) {
        
        audioEngine.stop()
        audioEngine.reset()
        // Play audio fast here...
        audioPlayer.stop()
        audioPlayer.rate = 2.0
        audioPlayer.currentTime = 0.0
        audioPlayer.play()
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        audioEngine.stop()
        audioEngine.reset()
        // Play audio slooooooowly here...
        audioPlayer.stop()
        audioPlayer.currentTime = 0.0
        audioPlayer.rate = 0.5
        audioPlayer.play()
    }

    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    func playAudioWithVariablePitch(pitch: Float) {
        audioEngine.stop()
        audioPlayer.stop()
        audioEngine.reset()
        
        // Step 3: Create an AVAudioPlayerNode
        let pitchPlayer = AVAudioPlayerNode()
        let timePitch = AVAudioUnitTimePitch()
        timePitch.pitch = pitch
        
        // Step 4: Attach player and pitch to AVAudioEngine
        audioEngine.attachNode(pitchPlayer)
        audioEngine.attachNode(timePitch)
        
        // Step 5: Connect pitchPlayer to timePitch and format for nil
        audioEngine.connect(pitchPlayer, to: timePitch, format: nil)
        // Step 6: Connect timePitch to Speaker(audioEngine.outputNode) and format for nil
        audioEngine.connect(timePitch, to: audioEngine.outputNode, format: nil)
        
        // Step 7: Schedule it
        pitchPlayer.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try! audioEngine.start()
        
        pitchPlayer.play()
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        audioPlayer.stop()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
