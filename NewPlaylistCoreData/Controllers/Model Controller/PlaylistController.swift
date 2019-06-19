//
//  PlaylistController.swift
//  NewPlaylistCoreData
//
//  Created by Jason Mandozzi on 6/19/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import Foundation

import CoreData

class PlaylistController {
    
    //Singleton
    //Shared Instance
    static let shared = PlaylistController()
    
    //Source of Truth
    var playlists: [Playlist] = []
    
    //Crud
    
    //Create
    func createPlaylistWith(name: String) {
        Playlist(name: name)
        PlaylistController.shared.saveToPersistentStore()
        
    }
    
    //Delete
    func delete(playlist: Playlist) {
        if let moc = playlist.managedObjectContext {
            moc.delete(playlist)
            saveToPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving to moc: \(error.localizedDescription)")
        }
    }
    
}
