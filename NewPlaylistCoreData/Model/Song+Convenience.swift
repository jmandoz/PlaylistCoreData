//
//  Song+Convenience.swift
//  NewPlaylistCoreData
//
//  Created by Jason Mandozzi on 6/19/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import Foundation

import CoreData

extension Song {
    
    @discardableResult
    
    convenience init(title: String, artist: String, playlist: Playlist, context: NSManagedObjectContext = CoreDataStack.managedObjectContext) {
        self.init(context: context)
        self.title = title
        self.artist = artist
        self.playlist = playlist
    }
}
