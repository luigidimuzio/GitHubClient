//
//  GitHubClient.swift
//  GitHubClient
//
//  Created by Luigi Di Muzio on 06/02/16.
//  Copyright © 2016 Luigi Di Muzio. All rights reserved.
//

import Foundation

class GitHubService {
    
    let baseUrl = "https://api.github.com/search/repositories"
    let session = NSURLSession.sharedSession()
    
    func fetchSwiftTrendingRepositories(completion: [GitHubRepository] -> Void) {

        let url = NSURL(string: baseUrl+"?q=language:swift&sort=stars&order=desc")!
        let request = NSURLRequest(URL: url)
        
        session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            guard let data = data else { return }
            do {
                if let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary,
                    let jsonRepos = json["items"] as? [NSDictionary] {
                        let repositories:[GitHubRepository] = jsonRepos.flatMap{ GitHubRepository(dictionary: $0)}
                        completion(repositories)
                } else {
                    completion([])
                }
            }
            catch {
                print("error")
                completion([])
            }
        
        }.resume()
    }
}