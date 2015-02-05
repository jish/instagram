//
//  PhotosViewController.swift
//  instagram
//
//  Created by Josh Lubaway on 2/4/15.
//  Copyright (c) 2015 Frustrated Inc. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var photos = []
    var refreshControl: UIRefreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self,, forControlEvents: <#UIControlEvents#>)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 320
        
        var clientId = "CLIENT_ID"
        
        var url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        var request = NSURLRequest(URL: url)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as NSDictionary
            self.photos = responseDictionary["data"] as NSArray
            self.tableView.reloadData()
            
            println("response: \(self.photos)")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photos.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("photoCell") as PhotoTableViewCell

        var photoData = photos[indexPath.row] as NSDictionary
        var url = NSURL(string: photoData.valueForKeyPath("images.thumbnail.url") as String)
        cell.photoView.setImageWithURL(url)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var vc = segue.destinationViewController as PhotoDetailsViewController
        var photoData = [:]
        var indexPath = tableView.indexPathForCell(sender as UITableViewCell)
        var row = indexPath?.row
        if (row != nil) {
            println(row!)
            var photoData = photos[row!] as NSDictionary
            vc.photo = photoData
        }
        
//        println(indexPath.)
//
//        
        
    }


}
