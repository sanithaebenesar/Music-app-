//
//  ViewController.swift
//  MusicApp
//
//  Created by CH 002 on 13/10/22.
//
struct Music {
    let name : String
    let albumName : String
    let imageName : String
}
import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var musicTable: UITableView!
   var songArray :[String] = ["song1","song2","song3","song4","song1","song2","song3","song4","song1","song2","song3","song4"]
    var audio : AVAudioPlayer?
    var songs = [Music(name: "song1", albumName: "song123", imageName: "song1"),Music(name: "song2", albumName: "song234", imageName: "song2"),Music(name:"song3", albumName: "song345", imageName: "song3"),Music(name: "song4", albumName: "song456", imageName: "song4"),Music(name: "song1", albumName: "song123", imageName: "song1"),Music(name: "song2", albumName: "song234", imageName: "song2"),Music(name:"song3", albumName: "song356", imageName: "song3"),Music(name: "song4", albumName: "song456", imageName: "song4"),Music(name: "song1", albumName: "song123", imageName: "song1"),Music(name: "song2", albumName: "song234", imageName: "song2"),Music(name:"song3", albumName: "song345", imageName: "song3"),Music(name: "song4", albumName: "song456", imageName: "song4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicTable.delegate = self
        musicTable.dataSource = self
    }


}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell") as! musicTableViewCell
        let song = songs[indexPath.row]
        cell.songNameLabel.text = song.name
        cell.albumNameLabel.text = song.albumName
        cell.songImageView.image = UIImage(named: song.imageName)
        cell.accessoryType = .disclosureIndicator // to show >
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let song = songs[indexPath.row]
      let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "playerViewController") as! playerViewController
        vc.img = UIImage(named: song.imageName)
        vc.album = song.albumName
        vc.name = song.name
        vc.music = songArray[indexPath.row]
    self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}



