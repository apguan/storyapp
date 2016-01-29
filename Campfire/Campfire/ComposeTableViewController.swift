//
//  ComposeTableViewController.swift
//  Campfire
//
//  Created by Allen Guan on 1/27/16.
//  Copyright © 2016 Allen Guan. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class ComposeTableViewController: UIViewController {
    
    @IBOutlet weak var shortDescription: UITextView!
    @IBOutlet weak var characterLimit: UILabel!
    @IBOutlet weak var typeStory: UITextView!
    
    @IBAction func submitStory(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shortDescription.layer.borderColor = UIColor.blackColor().CGColor
        shortDescription.layer.borderWidth = 0.5
        
    }
    
    

}

