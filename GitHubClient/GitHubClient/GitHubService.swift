//
//  GitHubClient.swift
//  GitHubClient
//
//  Created by Luigi Di Muzio on 06/02/16.
//  Copyright © 2016 Luigi Di Muzio. All rights reserved.
//

import Foundation

public enum ServiceError {
    case InvalidJSON
    case InvalidData
}

public enum ServiceResult<T> {
    case Success(T)
    case Failure(ServiceError)
}

class GitHubService {
    
    let baseUrl = "https://api.github.com/"
    let repositoriesUrl = "search/repositories"
    
    let session = NSURLSession.sharedSession()
    
    func fetchSwiftTrendingRepositories(completion: (ServiceResult<GitHubRepositories>) -> Void) {

        let url = NSURL(string: baseUrl+repositoriesUrl+"?q=language:swift&sort=stars&order=desc")!
        let request = NSURLRequest(URL: url)
        
        session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            guard let data = data else {
                completion(.Failure(.InvalidData))
                return
            }
            
            do {
                if let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary,
                    let jsonRepos = json["items"] as? [NSDictionary] {
                        let repositories:[GitHubRepository] = jsonRepos.flatMap{ GitHubRepository(dictionary: $0)}
                        completion(.Success(repositories))
                } else {
                    completion(.Failure(.InvalidJSON))
                }
            }
            catch {
                print("error")
                completion(.Failure(.InvalidJSON))
            }
        
        }.resume()
    }
}