//
//  ScholarshipCollectionViewCell.swift
//  PersonalizeProfile
//
//  Created by Cahyanto Setya Budi on 12/23/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class ScholarshipCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var scholarshipCategoriesButton: UIButton!
    @IBAction func scholarshipButton(_ sender: UIButton) {
        if scholarshipCategoriesButton.isSelected == false {
            scholarshipCategoriesButton.isSelected = true
            scholarshipCategoriesButton.setTitleColor(UIColor.white, for: .normal)
            scholarshipCategoriesButton.backgroundColor = UIColor(red: 56/255, green: 196/255, blue: 202/255, alpha: 1)
            scholarshipCategoriesButton.layer.borderColor = UIColor(red: 46/255, green: 157/255, blue: 161/255, alpha: 1).cgColor
        } else {
            scholarshipCategoriesButton.isSelected = false
            scholarshipCategoriesButton.setTitleColor(UIColor(red: 84/255, green: 84/255, blue: 84/255, alpha: 1), for: .normal)
            scholarshipCategoriesButton.backgroundColor = UIColor(red: 251/255, green: 251/255, blue: 251/255, alpha: 1)
            scholarshipCategoriesButton.layer.borderColor = UIColor(red: 84/255, green: 84/255, blue: 84/255, alpha: 1).cgColor
        }
    }
    
}
