//
//  PhotoDetailsViewController.swift
//  instagram
//
//  Created by Josh Lubaway on 2/4/15.
//  Copyright (c) 2015 Frustrated Inc. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var photo: NSDictionary = [:]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("topPhotoDetailTableViewCell") as TopPhotoDetailTableViewCell
        println(self.photo)
        var urlString = self.photo.valueForKeyPath("images.low_resolution.url") as String
        println(urlString)
        var url = NSURL(string: urlString)
        cell.photoView.setImageWithURL(url)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 306
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
