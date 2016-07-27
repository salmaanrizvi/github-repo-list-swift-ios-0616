//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    var fullName : String
    var htmlURL : NSURL
    var repositoryID : NSNumber
    
    init(dictionary: NSDictionary) {
        self.fullName = dictionary["full_name"] as! String
        self.htmlURL = NSURL(string: dictionary["html_url"] as! String)!
        self.repositoryID = dictionary["id"] as! NSNumber
    }
}
