//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories : [GithubRepository] = []
    
    func getRepositoriesWithCompletion(completion: () -> ()) {
        
        print("Size of ReposDataStore reposArray: \(self.repositories.count)")
        print("Clearing ReposDataStore reposArray")
        
        ReposDataStore.sharedInstance.repositories = []
        
        GithubAPIClient.getRepositoriesWithCompletion { (repos) in
        
            print("Inside ReposDataStore's completion handler.")
            
            for dictionary in repos {
            
                print("For every dictionary returned in the repo, appending to reposArray")
                
                self.repositories.append(GithubRepository(dictionary: dictionary))
            
                print(self.repositories.count)
            }
            completion()
        }
    }
    
}
