//
//  CreateViewController.swift
//  MyLearning
//
//  Created by Rang, Winters on 23/07/2017.
//  Copyright © 2017 Rang, Winters. All rights reserved.
//

import UIKit
import os.log

class CreateViewController: UIViewController {

    
    // MARK: Properties
    var learning: Learning?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var unit: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Mark: Action
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
        
        let typeValue = type.text ?? ""
        let nameVaule = name.text ?? ""
        let numberValue = Int(number.text ?? "") ?? 0
        let unitValue = unit.text ?? ""
        let statusValue = "Not Started"
        
        learning = Learning(id: "", type: typeValue, name: nameVaule, number: numberValue, unit: unitValue, status: statusValue)
        
    }
    

}
