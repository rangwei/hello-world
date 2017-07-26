//
//  CreateProgressViewController.swift
//  MyLearning
//
//  Created by Rang, Winters on 23/07/2017.
//  Copyright © 2017 Rang, Winters. All rights reserved.
//

import UIKit
import os.log


class CreateProgressViewController: UIViewController {
    
    //MARK: Properties
    
    var progress: LearningProgress?
    
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var lecture: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let progress = progress {
            date.text = progress.date
            lecture.text = progress.lecture
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }

        let dateValue = date.text ?? ""
        let lectureValue = lecture.text ?? ""
        progress = LearningProgress(learning_id: "1", id: "6", date: dateValue, lecture: lectureValue)
    }
    

}
