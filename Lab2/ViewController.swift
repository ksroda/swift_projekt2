//
//  ViewController.swift
//  Lab2
//
//  Created by Użytkownik Gość on 12.10.2016.
//  Copyright © 2016 Użytkownik Gość. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var i = 0;
    //let plistCatPath = NSBundle.mainBundle().pathForResource("albums", ofType: "plist");
    var albums = Albums.sharedInstance.albums
    
    var album: NSDictionary?
    //var albums: NSMutableArray?
    var albumsLicz: Int?
    
    @IBOutlet weak var ArtistField: UITextField!
    @IBOutlet weak var TitleField: UITextField!
    @IBOutlet weak var GenreField: UITextField!
    @IBOutlet weak var YearField: UITextField!
    @IBOutlet weak var RateField: UILabel!
    
    @IBOutlet weak var RatingButton: UIStepper!

    @IBOutlet weak var SaveButton: UIButton!
    @IBOutlet weak var DeleteButton: UIButton!

    @IBOutlet weak var AnulujButton: UIButton!
    
    //------------BUTTONS------------------------------------

    @IBAction func AnulujButtonPressed(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func SaveButtonPressed(sender: AnyObject) {
        
        let newAlbum : NSDictionary = [
            "artist" : ArtistField.text!,
            "title" : TitleField.text!,
            "genre" : GenreField.text!,
            "date" : Int(YearField.text!)!,
            "rating" : Int(RateField.text!)!
        ]
        
        Albums.sharedInstance.savePressed(i, newAlbum: newAlbum)
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func RateButtonPressed(sender: UIStepper) {
        RateField.text = Int(sender.value).description
    }

    
    @IBAction func DeleteButtonPressed(sender: AnyObject) {
        print("nnn \(i) albums.count \(albums?.count)!")
        
        Albums.sharedInstance.delete(i)
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    //------- NEW BUTTON -----------------------------------
    @IBAction func NewButtonPressed(sender: AnyObject) {
        i = (albums?.count)!
        addNewAlbum()
    }
    
    func edit(index : Int, newAlbum : NSDictionary){
        albums!.replaceObjectAtIndex(index, withObject: newAlbum)
    }
    
    func addNewAlbum(){
        ArtistField.text = ""
        TitleField.text = ""
        GenreField.text = ""
        YearField.text = ""
        RateField.text = ""
        DeleteButton.enabled = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        RatingButton.wraps = true
        RatingButton.autorepeat = true
        RatingButton.maximumValue = 10
        
        //ns dictionary w srodku
        //albums = NSMutableArray(contentsOfFile:plistCatPath!);
        changeValues()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func emptyArray(){
        print("empty array")
        
        ArtistField.text = ""
        TitleField.text = ""
        GenreField.text = ""
        YearField.text = ""
        RateField.text = ""
        DeleteButton.enabled = false

        i = 0
    }
    
    func changeValues(){

            ArtistField.text = album!.valueForKey("artist") as! String
            TitleField.text = album!.valueForKey("title") as! String
            GenreField.text = album!.valueForKey("genre") as! String
            YearField.text = album!.valueForKey("date")?.stringValue
            RateField.text = album!.valueForKey("rating")?.stringValue
        
        DeleteButton.enabled = true

    }

}

