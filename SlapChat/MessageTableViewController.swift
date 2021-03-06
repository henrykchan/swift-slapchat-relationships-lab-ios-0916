//
//  TableViewController.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class MessageTableViewController: UITableViewController {
    
    var store = DataStore.sharedInstance
   var messages = [Message]()
    var recipient : Recipient!


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.messages = recipient.messages?.allObjects as! [Message]
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)

        let eachMessage = self.messages[indexPath.row]
        
        cell.textLabel?.text = eachMessage.content
        
        

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addMessage" {
            
            let dest = segue.destination as! AddMessageViewController
            dest.recipient = self.recipient
        }
    }
    
    
    
    

    
}
