//
//  ObjectsTableViewController.swift
//  Campfire
//
//  Created by Allen Guan on 1/19/16.
//  Copyright © 2016 Allen Guan. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class ObjectsTableViewController: PFQueryTableViewController {

    
    override func queryForTable() -> PFQuery {
        
        let query = PFQuery(className: "UserData")
        query.cachePolicy = .CacheElseNetwork
        query.orderByDescending("createdAt")
        return query
        }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject?) -> PFTableViewCell? {
        
       
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! BaseTableViewCell
        
        cell.textView.text = object?.objectForKey("textView") as? String
        
        cell.numComments.text = object?.objectForKey("numComments") as? String
        
        cell.likes.text = object?.objectForKey("likes") as? String
        
        cell.elapsedTime.text = object?.objectForKey("elapsedTime") as? String
        
        
       let imageFile = object?.objectForKey("image") as? PFFile
        cell.cellImageView.image = UIImage(named: "placeholder")
        cell.cellImageView.file = imageFile
        cell.cellImageView.loadInBackground()
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row + 1 > self.objects?.count
        {
            return 44
        }
        let height = super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        return height
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.row + 1 > self.objects?.count
            {
                self.loadNextPage()
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
            }
            else
            {
            self.performSegueWithIdentifier("showDetail", sender: self)
            }
        
        }


   func performForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        if segue.identifier == "showDetail"
        {
            let indexPath = self.tableView.indexPathForSelectedRow
            let detailVC = segue.destinationViewController as! PreviewViewController
          
            let object = self.objectAtIndexPath(indexPath)
           
            detailVC.titleString = object?.objectForKey("title") as! String
            detailVC.imageFile = object?.objectForKey("image") as! PFFile
            self.tableView.deselectRowAtIndexPath(indexPath!, animated: true)
        }
    }
}









