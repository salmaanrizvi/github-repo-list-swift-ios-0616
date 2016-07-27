//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    let sharedRepos = ReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityLabel = "tableView"
        
        print("First call to get repos with completion from DataStore.")
        
        sharedRepos.getRepositoriesWithCompletion {
            
            print("In TVC Completion Hanlder")
            
            dispatch_async(dispatch_get_main_queue()) {
             
                print("Data received. Reloading table view!!!")
                self.tableView.reloadData()
            }
        }
        
    }

    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sharedRepos.repositories.count
    }
 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
        
        print(sharedRepos.repositories[indexPath.row].fullName)
        
        cell.textLabel?.text = sharedRepos.repositories[indexPath.row].fullName
        
        return cell
    }

}
