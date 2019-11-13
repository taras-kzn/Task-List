//
//  AddTwoTaskViewController.swift
//  Task-List
//
//  Created by admin on 13.11.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AddTwoTaskViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableview.delegate = self
        tableview.dataSource = self
    }
}
extension AddTwoTaskViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddTwoTask", for: indexPath) as! AddTwoTaskTableViewCell
        cell.taskLabel.text = "task 2"
        return cell
    }
    
    
}
