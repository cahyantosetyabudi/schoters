//
//  HomeTableViewCell.swift
//  PersonalizeProfile
//
//  Created by Cahyanto Setya Budi on 12/23/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameScholarshipLabel: UILabel!
    @IBOutlet weak var datePostedScholarshipLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
