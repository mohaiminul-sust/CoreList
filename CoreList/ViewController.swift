//
//  ViewController.swift
//  CoreList
//
//  Created by ANDROMEDA on 7/26/16.
//  Copyright © 2016 infancyit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var names = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "\"CoreList\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addItem(sender: AnyObject) {
        self.addName()
    }

}

// MARK :- UITableView DataSource
extension ViewController : UITableViewDataSource {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        
        cell?.textLabel?.text = names[indexPath.row]
        
        return cell!
    }
}

// MARK :- Extra Methods
extension ViewController {
    
    func addName(){
        let alert = UIAlertController(title: "New Name", message: "Enter name", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action: UIAlertAction) -> Void in
        
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .Default, handler: { (action: UIAlertAction) -> Void in
            let textField = alert.textFields?.first
            self.names.append((textField?.text)!)
            self.tableView.reloadData()
        })
        
        alert.addTextFieldWithConfigurationHandler(){ (textField: UITextField) -> Void in
            textField.adjustsFontSizeToFitWidth = true
        }
        
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

