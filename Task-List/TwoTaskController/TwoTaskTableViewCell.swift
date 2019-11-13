//
//  TwoTaskTableViewCell.swift
//  Task-List
//
//  Created by admin on 13.11.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class TwoTaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var underTaskCountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
