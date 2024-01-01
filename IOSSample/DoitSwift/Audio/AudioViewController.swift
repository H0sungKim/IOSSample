//
//  AudioViewController.swift
//  IOSSample
//
//  Created by Hosung.Kim on 2023/12/31.
//

import UIKit
import AVFoundation

class AudioViewController: UIViewController {    
    
    var audioPlayer: AVAudioPlayer!
    var audioFile: URL!
    
    var progressTimer: Timer!
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var sldVolume: UISlider!
    @IBOutlet weak var pvPlayTime: UIProgressView!
    @IBOutlet weak var lbCurrentTime: UILabel!
    @IBOutlet weak var lbEndTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize() {
        audioFile = Bundle.main.url(forResource: "Sogno di Volare The Dream of Flight", withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch let error as NSError {
            NSLog("\(error)")
        }
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        lbEndTime.text = convertTimeFormat(time: Int(audioPlayer.duration))
        enableBtns(play: true, pause: false, stop: false)
        pvPlayTime.progress = 0
        lbCurrentTime.text = "00:00"

        sldVolume.maximumValue = 10.0
        sldVolume.value = 1.0
        audioPlayer.volume = sldVolume.value
    }
    
    private func convertTimeFormat(time: Int) -> String {
        return "\(String(format: "%02d", time/60)):\(String(format: "%02d", time%60))"
    }
    private func enableBtns(play: Bool, pause: Bool, stop: Bool) {
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    @objc private func updatePlayTime() {
        lbCurrentTime.text = convertTimeFormat(time: Int(audioPlayer.currentTime))
        pvPlayTime.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
    @IBAction func onClickPlay(_ sender: Any) {
        audioPlayer.play()
        enableBtns(play: false, pause: true, stop: true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(AudioViewController.updatePlayTime), userInfo: nil, repeats: true)
    }
    @IBAction func onClickPause(_ sender: Any) {
        audioPlayer.pause()
        enableBtns(play: true, pause: false, stop: true)
    }
    @IBAction func onClickStop(_ sender: Any) {
        audioPlayer.stop()
        enableBtns(play: true, pause: false, stop: false)
        progressTimer.invalidate()
        lbCurrentTime.text = "00:00"
        audioPlayer.currentTime = 0
    }
    
    @IBAction func volumeChanged(_ sender: UISlider) {
        audioPlayer.volume = sender.value
    }
    
}

extension AudioViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        enableBtns(play: true, pause: false, stop: false)
    }
}
