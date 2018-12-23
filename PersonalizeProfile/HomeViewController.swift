//
//  HomeViewController.swift
//  PersonalizeProfile
//
//  Created by Cahyanto Setya Budi on 12/23/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    var scholarshipCategories: [ScholarshipCategories] = []
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXXXX"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(abbreviation: "GMT+7:00")
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = Bundle.main.loadNibNamed("HomeHeaderCell", owner: self, options: nil)?.first as! HomeHeaderCell
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scholarshipCategories.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        let date = formatter.date(from: scholarshipCategories[indexPath.row].publishedAt)

        let formattedDate = DateFormatter()
        formattedDate.dateStyle = .long
        
        cell.nameScholarshipLabel.text = scholarshipCategories[indexPath.row].name
        cell.datePostedScholarshipLabel.text = formattedDate.string(from: date!)
        
        return cell
    }
}
