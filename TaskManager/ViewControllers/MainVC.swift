//
//  MainVC.swift
//  TaskManager
//
//  Created by Tanner York on 11/26/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var TaskTableView: UITableView!
    @IBOutlet weak var TaskListTitle: UINavigationItem!
    @IBOutlet weak var doneButton: UIButton!
    
    //Variable to distiguish the current table view loaded: all, completed, not completed.
    var taskList: TaskToList = .all
    var backgroundColor: UIColor? {
        didSet {
            self.backgroundColor = SetupValues.shared.backgroundColor
            TaskTableView.backgroundColor = SetupValues.shared.backgroundColor
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        TaskTableView.backgroundColor = SetupValues.shared.backgroundColor
        
        
        //GestureRecognizer for changing the current taskList shown to user
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
        
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)


    }
    
    //MARK: Actions
    @IBAction func unwindToMainVC(segue: UIStoryboardSegue) {
    }
    
    
    //Presents an action sheet for user to choose between change background color and edit the location of a task in the table view
    @IBAction func settingsButton(_ sender: Any) {
        let settingSheet = UIAlertController(title: "Settings", message: "Change background color and task lasyout.", preferredStyle: .actionSheet)
        
        //Segues to change color screen
        let colorButton = UIAlertAction(title: "Colors", style: .default) { (action) in
            self.performSegue(withIdentifier: "segueToColorSettings", sender: self)
        }
        
        //Puts table view into edit mode and presents the done button
        let editButton = UIAlertAction(title: "Edit Task", style: .default) { (action) in
            self.doneButton.isHidden = false
            self.TaskTableView.isEditing = true
            return
        }
        settingSheet.addAction(colorButton)
        settingSheet.addAction(editButton)
        present(settingSheet, animated: true)
    }
    
    //Puts table view edit mod it false and hides itself
    @IBAction func finishEdit(_ sender: Any) {
        TaskTableView.isEditing = false
        doneButton.isHidden = true
    }
    
    //Handles swipes
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .right:
                print("Right")
                if taskList == .all {
                    taskList = .notCompleted
                    TaskListTitle.title = "Tasks Not Completed"
                    TaskTableView.reloadData()
                } else if taskList == .notCompleted {
                    taskList = .completed
                    TaskListTitle.title = "Tasks Completed"
                    TaskTableView.reloadData()
                } else if taskList == .completed {
                    taskList = .all
                    TaskListTitle.title = "All Tasks"
                    TaskTableView.reloadData()
                }
            default:
                print("error")
            }
        }
       
    }
    
    
    //Prepares data from a selected cell to be used on the details view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendData" {
            var indexpath = TaskTableView.indexPathsForSelectedRows!.first
            var task = SetupValues.shared.tasks[indexpath!.row]
            var destication = segue.destination as! DetailsVC
            
            if taskList == .all {
                indexpath = TaskTableView.indexPathsForSelectedRows!.first
                task = SetupValues.shared.tasks[indexpath!.row]
                destication = segue.destination as! DetailsVC
                destication.setupView(task)

            }
            if taskList == .completed {
                indexpath = TaskTableView.indexPathsForSelectedRows!.first
                task = SetupValues.shared.tasksCompleted[indexpath!.row]
                destication = segue.destination as! DetailsVC
                destication.setupView(task)
            }
            if taskList == .notCompleted {
                indexpath = TaskTableView.indexPathsForSelectedRows!.first
                task = SetupValues.shared.tasksNotCompleted[indexpath!.row]
                destication = segue.destination as! DetailsVC
                destication.setupView(task)
            }
            
            
        
            
        }
    }
    

}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch taskList {
        case .all:
            return SetupValues.shared.tasks.count
        case .completed:
            return SetupValues.shared.tasksCompleted.count
        case .notCompleted:
            return SetupValues.shared.tasksNotCompleted.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TaskTVC
        switch taskList {
        case .all:
            cell.setupCell(task: SetupValues.shared.tasks[indexPath.row])
        case .completed:
            cell.setupCell(task: SetupValues.shared.tasks[indexPath.row])
        case .notCompleted:
            cell.setupCell(task: SetupValues.shared.tasks[indexPath.row])
        }
        return cell
    }
    
    //Handles the edit mode to move table view cells by removing and adding the task in the acording task lists
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var movedObject = SetupValues.shared.tasks[sourceIndexPath.row]
        switch taskList {
        case .all:
            movedObject = SetupValues.shared.tasks[sourceIndexPath.row]
            SetupValues.shared.tasks.remove(at: sourceIndexPath.row)
            SetupValues.shared.tasks.insert(movedObject, at: destinationIndexPath.row)
        case .completed:
            movedObject = SetupValues.shared.tasksCompleted[sourceIndexPath.row]
            SetupValues.shared.tasksCompleted.remove(at: sourceIndexPath.row)
            SetupValues.shared.tasksCompleted.insert(movedObject, at: destinationIndexPath.row)
        case .notCompleted:
            movedObject = SetupValues.shared.tasksNotCompleted[sourceIndexPath.row]
            SetupValues.shared.tasksNotCompleted.remove(at: sourceIndexPath.row)
            SetupValues.shared.tasksNotCompleted.insert(movedObject, at: destinationIndexPath.row)
        }
    }
    
     func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
     func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    //Adds the delete and change completion buttons
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            switch self.taskList {
            case .all:
                let task = SetupValues.shared.tasks[indexPath.row]
                self.removeTask(task, indexPath.row)
                SetupValues.shared.tasks.remove(at: indexPath.row)
                self.TaskTableView.reloadData()
                
            case .completed:
                let task = SetupValues.shared.tasksCompleted[indexPath.row]
                self.removeTask(task, indexPath.row)
                SetupValues.shared.tasksCompleted.remove(at: indexPath.row)
                self.TaskTableView.reloadData()
                
            case.notCompleted:
                let task = SetupValues.shared.tasksNotCompleted[indexPath.row]
                self.removeTask(task, indexPath.row)
                SetupValues.shared.tasksNotCompleted.remove(at: indexPath.row)
                self.TaskTableView.reloadData()
            }
            
        }
        
        let markComplete = UITableViewRowAction(style: .normal, title: "Complete") { (action, indexPath) in
            var task = SetupValues.shared.tasks[indexPath.row]
            switch self.taskList {
            case .all:
                task = SetupValues.shared.tasks[indexPath.row]
            case .completed:
                task = SetupValues.shared.tasksCompleted[indexPath.row]
            case .notCompleted:
                task = SetupValues.shared.tasksNotCompleted[indexPath.row]
            }
            task.completion = true
            task.completionDate = nil
            self.TaskTableView.reloadData()
        }
        
        let markUncomplete = UITableViewRowAction(style: .normal, title: "Mark Uncomplete") { (action, indexPath) in
            var task = SetupValues.shared.tasks[indexPath.row]
            switch self.taskList {
            case .all:
                task = SetupValues.shared.tasks[indexPath.row]
            case .completed:
                task = SetupValues.shared.tasksCompleted[indexPath.row]
            case .notCompleted:
                task = SetupValues.shared.tasksNotCompleted[indexPath.row]
            }
            task.completion = false
            task.completionDate = nil
            self.TaskTableView.reloadData()
        }
        
        var task: Task?
        switch taskList {
        case .all:
            task = SetupValues.shared.tasks[indexPath.row]
        case .completed:
            task = SetupValues.shared.tasksCompleted[indexPath.row]
        case .notCompleted:
            task = SetupValues.shared.tasksNotCompleted[indexPath.row]
        }
        
        switch task?.completion {
        case true:
            return [deleteAction, markUncomplete]
        case false:
            return [deleteAction, markComplete]
        default:
            return [deleteAction]
        }
    }
    
    //function to remove a task from all the task lists
    func removeTask(_ task: Task,_ indexPathRow: Int) {
        var taskToRemove: Task

        switch taskList {
        case .all:
            taskToRemove = SetupValues.shared.tasks[indexPathRow]
        case .completed:
            taskToRemove = SetupValues.shared.tasksCompleted[indexPathRow]
        case .notCompleted:
            taskToRemove = SetupValues.shared.tasksNotCompleted[indexPathRow]
        }
        
        if taskList != .notCompleted {
            for task in SetupValues.shared.tasksNotCompleted {
                if task.title == taskToRemove.title {
                    SetupValues.shared.tasksNotCompleted.remove(at: SetupValues.shared.tasksNotCompleted.firstIndex(where: { (taskInArray) -> Bool in
                        var returnValue: Bool?
                        if taskInArray.title == task.title {
                            returnValue = true
                        }
                        return returnValue!})!)
                }
            }
        }
        
        if taskList != .completed {
            for task in SetupValues.shared.tasksNotCompleted {
                if task.title == taskToRemove.title {
                    SetupValues.shared.tasksCompleted.remove(at: SetupValues.shared.tasksCompleted.firstIndex(where: { (taskInArray) -> Bool in
                        var returnValue: Bool?
                        if taskInArray.title == task.title {
                            returnValue = true
                        }
                        return returnValue!})!)
                }
            }
        }
        
        if taskList != .all {
            for task in SetupValues.shared.tasks {
                if task.title == taskToRemove.title {
                    SetupValues.shared.tasks.remove(at: SetupValues.shared.tasks.firstIndex(where: { (taskInArray) -> Bool in
                        var returnValue: Bool?
                        if taskInArray.title == task.title {
                            returnValue = true
                        }
                        return returnValue!})!)
                }
            }
        }
        
    }
    
}
