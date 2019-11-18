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
    
    var taskList: File = Folder(name: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
      
        title = taskList.name
//        taskList.addArrayFile(array: Folder(name: "wefwe"))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTwoTask" {
            guard let destanation = segue.destination as? AddTwoTaskViewController else {return}
            destanation.taskDelegate = self
        }
    }
}

extension TwoTaskViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.countContent() ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TwoTask", for: indexPath) as! TwoTaskTableViewCell
        guard let array = taskList.showContent() as? [File] else {fatalError()}
        let item = array[indexPath.row]
        cell.taskLabel.text = item.name
        cell.underTaskCountLabel.text = "\(item.countContent())"
        return cell
    }
}

extension TwoTaskViewController: AddTaskDelegate {
    
    func add(folder: File) {

       // taskList = folder
        self.taskList.addArrayFile(array: folder)
        tableView.reloadData()
    }
}
