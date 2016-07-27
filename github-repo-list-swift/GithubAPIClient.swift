//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

let URL = "https://api.github.com/repositories?client_id=" + clientID + "&client_secret=" + clientSecret

class GithubAPIClient {
    
    class func getRepositoriesWithCompletion(completion: ([NSDictionary]) -> Void) {
        
        print("Initializing url Session")
        
        let urlSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let task = urlSession.dataTaskWithURL(NSURL(string: URL)!) { (data, response, error) in
            
            print("In completion handler of Github API Client. Attemping to fetch data")
            
            if let data = data {
                do {
                    
                    let result = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [NSDictionary]
                    
                    print("received data from github. passing forward to completion handler")
                    
                    completion(result)
                    
                }
                catch {
                    print("error fetching data")
                }
            }
            
        }
        
        print("Initialized URL session and task. About to call resume.")
        
        task.resume()
        
        print("After calling task resume.")
    }
    
}

