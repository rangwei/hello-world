//
//  EmotionalViewController.swift
//  FaceIt
//
//  Created by Rang, Winters on 18/07/2017.
//  Copyright © 2017 Rang, Winters. All rights reserved.
//

import UIKit

class EmotionalViewController: UIViewController {


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            switch identifier {
                case "happy":
                    if let vc = segue.destination as? FaceViewController {
                        vc.happy()
                    }
                
                case "unhappy":
                    if let vc = segue.destination as? FaceViewController {
                        vc.unhappy()
                    }
                break
            default: break
            }
        }
    }
    


}
