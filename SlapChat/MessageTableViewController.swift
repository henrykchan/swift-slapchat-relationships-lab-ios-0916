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
    var recipient : Recipient?

    override func viewDidLoad() {
        super.viewDidLoad()
       self.messages = recipient?.messages?.allObjects as! [Message]
        
        store.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        store.fetchData()
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return store.messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)

        let eachMessage = store.messages[indexPath.row]
        
        cell.textLabel?.text = eachMessage.content

        return cell
    }
    
    
    
    

    
}
