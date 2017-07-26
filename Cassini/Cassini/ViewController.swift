//
//  ViewController.swift
//  Cassini
//
//  Created by Rang, Winters on 19/07/2017.
//  Copyright © 2017 Rang, Winters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let fiori = "https://www.sapfioritrial.com/landingPage/images/tablet.png"
    
    @IBOutlet weak var scrollView: UIScrollView!
    var imageURL: NSURL? {
        didSet {
            image = nil
            fetchImage()
        }
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    private func fetchImage() {
        if let url = imageURL {
            if let imageData = NSData(contentsOf: url as URL) {
                image = UIImage(data: imageData as Data)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.addSubview(imageView)
        
        
        imageURL = NSURL(string: fiori)
    }

}

