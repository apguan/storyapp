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
        
        let query = PFQuery(className: "Object")
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
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
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
}
