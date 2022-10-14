//
//  playerViewController.swift
//  MusicApp
//
//  Created by CH 002 on 13/10/22.
//

import UIKit
import AVFoundation
class playerViewController: UIViewController {
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var playerName: UILabel!
    
    @IBOutlet weak var playerAlbum: UILabel!
    var  myAudioPlayer = AVAudioPlayer()
   
  
    var img : UIImage?
    var name : String = ""
    var album : String = ""
    var music : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            playerImage.image = img
            playerName.text = name
            playerAlbum.text = album
       
    }
    func soundFiles() {
        if music != nil {
        let path = Bundle.main.path(forResource:music, ofType: ".mp3")
            let url = URL(fileURLWithPath: path!)
        
           do {
               myAudioPlayer = try AVAudioPlayer(contentsOf:url)
           }
        catch {
               print("sound not found")
           }
       }
    }
    
    @IBAction func playButtonAction(_ sender: Any) {
       soundFiles()
        myAudioPlayer.play()
    }
    
    
    @IBAction func pauseButtaonAction(_ sender: Any) {
        if myAudioPlayer.isPlaying {
                    myAudioPlayer.pause()
                } else {
                    myAudioPlayer.play()
                }
    }
    

      
    
}

