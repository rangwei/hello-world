//
//  ViewController.swift
//  FaceIt
//
//  Created by Rang, Winters on 08/07/2017.
//  Copyright © 2017 Rang, Winters. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {
    
    @IBOutlet weak var fv: FaceView!
    
    private var emotional = 0.0
    
    override func viewDidLoad() {
       fv.curvature =  emotional
    }
    
    func happy() {
        emotional = 1
    }
    
    func unhappy() {
        emotional = -1
    }
}

