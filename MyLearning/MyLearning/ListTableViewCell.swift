//
//  ListTableViewCell.swift
//  MyLearning
//
//  Created by Rang, Winters on 23/07/2017.
//  Copyright © 2017 Rang, Winters. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var unit: UILabel!
    @IBOutlet weak var progress: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
