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
    
}
