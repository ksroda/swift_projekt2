import UIKit

class MyTableViewController: UITableViewController {

   var albums = Albums.sharedInstance.albums
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "AlbumCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        cell.textLabel!.text = albums![indexPath.row]["artist"] as! String
        cell.detailTextLabel!.text = albums![indexPath.row]["title"] as! String
        
        return cell
    }
    
    func newAlbum () -> NSDictionary {
        let album:NSDictionary = [
            "artist": "",
            "title": "",
            "genre": "",
            "date": 2016,
            "rating": 0
        ]
        return album
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let vc = segue.destinationViewController as? ViewController {
            if let cell = sender as? UITableViewCell {
                if let index = tableView.indexPathForCell(cell) {
                    vc.album = albums![index.row] as! NSDictionary
                    vc.albumsLicz = albums!.count
                    vc.i = index.row
                }
            } else {
                vc.album = newAlbum()
               // vc.albumsLicz = albums!.count + 1
               // vc.i = albums!.count
                //vc.addNewAlbum()
                
                
                
            }
        }
    }


}
