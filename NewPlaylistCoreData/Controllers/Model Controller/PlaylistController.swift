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
    
    var playlists: [Playlist] {
        //creating a fetch request of type playlist that specifically references the playlist model obeject
        //telling the managed object
    let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        //use that fetch request to ask the managedObjectContext for all Playlist Model Objects that exist inside of the MOC
    return (try? CoreDataStack.managedObjectContext.fetch(request)) ?? []
    }
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
