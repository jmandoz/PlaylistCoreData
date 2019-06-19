//
//  SongController.swift
//  NewPlaylistCoreData
//
//  Created by Jason Mandozzi on 6/19/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import Foundation

import CoreData

class SongController {
    
    //Singleton
    //Shared Instance
    
    static let shared = SongController()
    
    //Crud
    
    //create
    func createNewSongWith(title: String, artist: String, playlist: Playlist) {
        Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.shared.saveToPersistentStore()
    }
    
    //delete
    
    
}
