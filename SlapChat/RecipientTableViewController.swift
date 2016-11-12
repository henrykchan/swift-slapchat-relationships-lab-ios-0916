//
//  NewTableViewController.swift
//  SlapChat
//
//  Created by Henry Chan on 11/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class RecipientTableViewController: UITableViewController {
    
    var store = DataStore.sharedInstance
    var recipientArray = [Recipient]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.recipientArray = store.recipients
        store.fetchData()
        print("This is teh arrayyyyy \(store.recipients.count)")
        print ("This is the messagessss!!!!! \(store.messages.count)")
        self.tableView.reloadData()

   
    }

 

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return store.recipients.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipientCell", for: indexPath)
        
        let theRecipient = store.recipients[indexPath.row]
            cell.textLabel?.text = theRecipient.name
        
        
        if let messageCount = theRecipient.messages?.count{
            cell.detailTextLabel?.text = "\(messageCount)"
            
        }
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = tableView.indexPathForSelectedRow
        
        let selectedRecipient = store.recipients[(indexPath?.row)!]
        
        let destinationVC = segue.destination as! MessageTableViewController
        destinationVC.recipient = selectedRecipient
     
            
        }
    }
    
    
  
    
    
    
    
    
    
    

    
    
    




