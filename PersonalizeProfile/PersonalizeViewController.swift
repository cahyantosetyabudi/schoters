//
//  PersonalizeViewController.swift
//  PersonalizeProfile
//
//  Created by Cahyanto Setya Budi on 12/23/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit
import AlignedCollectionViewFlowLayout

class PersonalizeViewController: UIViewController {

    @IBOutlet weak var scholarshipCollectionView: UICollectionView!
    
    var scholarshipCategories: [ScholarshipCategories] = []
    var selectedScholarship: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadScholarshipCategories()
        let alignedFlowLayout = scholarshipCollectionView.collectionViewLayout as! AlignedCollectionViewFlowLayout
        alignedFlowLayout.horizontalAlignment = .left
    }
    
    @IBAction func doneCategoriesButton(_ sender: UIButton) {
        print(selectedScholarship)
    }
    
    let session = URLSession.shared
    func loadScholarshipCategories() {
        let url = URL(string: "https://private-90552-schoterspersonal.apiary-mock.com/categories")
        let task = session.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode([ScholarshipCategories].self, from: data)
                self.scholarshipCategories = json
                DispatchQueue.main.async {
                    self.scholarshipCollectionView.reloadData()
                }
            } catch let err {
                print(err.localizedDescription)
                print(err)
            }
        }
        task.resume()
    }
}

extension PersonalizeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scholarshipCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = scholarshipCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ScholarshipCollectionViewCell
        cell.scholarshipCategoriesButton.setTitle(scholarshipCategories[indexPath.row].name, for: .normal)
        
        return cell
    }
}

extension PersonalizeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let scholarship = scholarshipCategories[indexPath.row].name
        let widthScholarship = scholarship.size(withAttributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 15)]).width + 16
        return CGSize(width: widthScholarship, height: 40)
    }
}

extension PersonalizeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let choosedCategories = scholarshipCategories[indexPath.row].id
        let cell = collectionView.cellForItem(at: indexPath) as! ScholarshipCollectionViewCell
        
        if cell.scholarshipCategoriesButton.isSelected == false {
            cell.scholarshipCategoriesButton.isSelected = true
            cell.scholarshipCategoriesButton.setTitleColor(UIColor.white, for: .normal)
            cell.scholarshipCategoriesButton.backgroundColor = UIColor(red: 56/255, green: 196/255, blue: 202/255, alpha: 1)
            cell.scholarshipCategoriesButton.layer.borderColor = UIColor(red: 46/255, green: 157/255, blue: 161/255, alpha: 1).cgColor
            
            selectedScholarship.append(choosedCategories)
        } else {
            cell.scholarshipCategoriesButton.isSelected = false
            cell.scholarshipCategoriesButton.setTitleColor(UIColor(red: 84/255, green: 84/255, blue: 84/255, alpha: 1), for: .normal)
            cell.scholarshipCategoriesButton.backgroundColor = UIColor(red: 251/255, green: 251/255, blue: 251/255, alpha: 1)
            cell.scholarshipCategoriesButton.layer.borderColor = UIColor(red: 84/255, green: 84/255, blue: 84/255, alpha: 1).cgColor
            
            let index = selectedScholarship.index(of: choosedCategories)
            selectedScholarship.remove(at: index!)
        }
    }
}

