//
//  PlaylistListTableViewController.swift
//  NewPlaylistCoreData
//
//  Created by Jason Mandozzi on 6/19/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import UIKit

class PlaylistListTableViewController: UITableViewController {
    
    @IBOutlet weak var playlistNameTextField: UITextField!
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        guard let name = playlistNameTextField.text, name != "" else {return}
        
        PlaylistController.shared.createPlaylistWith(name: name)
        playlistNameTextField.text = ""
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlaylistController.shared.playlists.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        
        let playlist = PlaylistController.shared.playlists[indexPath.row]
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\((playlist.songs?.count) ?? 0) songs"
        
        return cell
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            PlaylistController.shared.delete(playlist: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow,
            let destinationVC = segue.destination as? SongListTableViewController else {return}
            let playlistToSend = PlaylistController.shared.playlists[index.row]
            destinationVC.playlistLandingPad = playlistToSend
    }
}
