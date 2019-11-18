//
//  MainViewController.swift
//  Task-List
//
//  Created by admin on 12.11.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
   // var taskFolder: File = Folder(name: "Список задач")
    
    var taskFolder: File = Folder(name: "Список задач") {
        willSet {
            tableView.reloadData()
        }
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = taskFolder.name
        taskFolder.addArrayFile(array: Folder(name: "привет"))
        taskFolder.addArrayFile(array: Folder(name: "пока"))
        
        addarr()


    }
    
    func addarr() {
        guard let arr = taskFolder.showContent() as? [File] else {fatalError()}
        
        for i in arr {
            i.addArrayFile(array: Folder(name: "qwefwef"))
            print(i.name)
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskFolder.countContent()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for : indexPath) as! MainTableViewCell
        guard let array = taskFolder.showContent() as? [File] else {fatalError()}
        let item = array[indexPath.row]
        cell.taskLabel.text = item.name
        cell.underTasksCountLabel.text = "\(item.countContent())"
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "idTwoTask" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let vc = segue.destination as! TwoTaskViewController
                guard let task = taskFolder.showContent() as? [File] else {fatalError()}
                let item = task[indexPath.row]
                vc.taskList = item
               // vc.taskList.addArrayFile(array: item)
            }
        }
    }

}
