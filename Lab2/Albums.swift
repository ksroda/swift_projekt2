//
//  Albums.swift
//  Lab2
//
//  Created by Użytkownik Gość on 09.11.2016.
//  Copyright © 2016 Użytkownik Gość. All rights reserved.
//

import Foundation

class Albums{
    
    static let sharedInstance = Albums()
    var albums: NSMutableArray?
    var albumsDocPath: String = ""
    
    private init() {
        let plistPath = NSBundle.mainBundle().pathForResource("albums", ofType: "plist")
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        albumsDocPath = documentsPath.stringByAppendingString("/albums.plist")
        
        let fileManager = NSFileManager.defaultManager()
        if !fileManager.fileExistsAtPath(albumsDocPath) {
            try? fileManager.copyItemAtPath(plistPath!, toPath: albumsDocPath)
        }
        
        albums = NSMutableArray(contentsOfFile: albumsDocPath)
        
        
    }
    
    func save(){
        albums!.writeToFile(albumsDocPath, atomically: true)
    }
    
    func delete(i: Int){
        albums?.removeObjectAtIndex(i)
        save()
    }
    
    func edit(i: Int, newAlbum: NSDictionary){
        albums!.replaceObjectAtIndex(i, withObject: newAlbum)
    }
    
    func savePressed(i: Int, newAlbum: NSDictionary){
        if ( i == (albums?.count)! ) {
            albums!.addObject(newAlbum)
        } else {
            edit(i, newAlbum: newAlbum)
        }
        
        save()
    }
 
    
}
