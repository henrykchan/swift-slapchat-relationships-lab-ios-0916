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
 

    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        store.fetchData()
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
        
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "recipientSegue" {
    
            let destinationVC = segue.destination as! MessageTableViewController
            guard let indexPath = self.tableView.indexPathForSelectedRow?.row else { return }
            
            destinationVC.recipient = self.store.recipients[indexPath]
            
            
            
        }
    }
}





    
    
    

    
    
    




