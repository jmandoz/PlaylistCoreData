//
//  SongListTableViewController.swift
//  NewPlaylistCoreData
//
//  Created by Jason Mandozzi on 6/19/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController {

    var playlistLandingPad: Playlist?
    
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = playlistLandingPad?.name
    }
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let title = songNameTextField.text, title != "",
        let artist = artistNameTextField.text, artist != "" else {return}
        
        guard let playlist = playlistLandingPad else {return}
        
        SongController.shared.createNewSongWith(title: title, artist: artist, playlist: playlist)
        
        songNameTextField.text = ""
        artistNameTextField.text = ""
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return playlistLandingPad?.songs?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        guard let song = playlistLandingPad?.songs?[indexPath.row] as? Song else {return UITableViewCell()}
        
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artist
        
        return cell
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let song = playlistLandingPad?.songs?[indexPath.row] as? Song else {return}
            SongController.shared.delete(song: song)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

