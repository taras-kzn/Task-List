//
//  AddTwoTaskViewController.swift
//  Task-List
//
//  Created by admin on 13.11.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

protocol AddTaskDelegate: class {
    func add(folder: File)
}

class AddTwoTaskViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var taskFolder = Folder(name: "сходить в магазин")
    var taskDelegate: AddTaskDelegate?

    
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
       // let array = taskFolder[indexPath.row]
    //    let item = array[indexPath.row]
        let folder = self.taskFolder
        cell.taskLabel.text = folder.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let array = taskFolder[indexPath.row]
      //  let item = array[indexPath.row]
        let folder = self.taskFolder
       // print(folder.name)
        self.taskDelegate?.add(folder: folder)
        navigationController?.popViewController(animated: true)
    }
}
