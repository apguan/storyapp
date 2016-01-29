//
//  BaseTableViewCell.swift
//  Campfire
//
//  Created by Allen Guan on 1/20/16.
//  Copyright © 2016 Allen Guan. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class BaseTableViewCell: PFTableViewCell
{
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var numComments: UILabel!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var elapsedTime: UILabel!
    @IBOutlet weak var cellImageView: PFImageView!


}
