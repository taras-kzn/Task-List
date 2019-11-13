//
//  TwoTaskViewController.swift
//  Task-List
//
//  Created by admin on 13.11.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class TwoTaskViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        
    }
}

extension TwoTaskViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TwoTask", for: indexPath) as! TwoTaskTableViewCell
        cell.taskLabel.text = "Task 2"
        cell.underTaskCountLabel.text = "Task 2 count \(3)"
        return cell
    }
}
