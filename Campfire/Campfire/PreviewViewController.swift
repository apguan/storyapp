//
//  Detailed.swift
//  Campfire
//
//  Created by Allen Guan on 1/21/16.
//  Copyright © 2016 Allen Guan. All rights reserved.
//

import UIKit
import Parse

class PreviewViewController: UIViewController, UIScrollViewDelegate{
   
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var textViewString: String!
    var imageFile: PFFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.textViewString
        
        
        self.imageFile.getDataInBackgroundWithBlock { (imageData, error) -> Void in
        
            if error == nil
            {
                if let imageData = imageData
                {
                let image = UIImage(data: imageData)
                self.imageView.image = image
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        
        return self.imageView
        
    }
}