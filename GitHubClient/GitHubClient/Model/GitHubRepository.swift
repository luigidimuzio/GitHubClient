//
//  GitHubRepository.swift
//  GitHubClient
//
//  Created by Luigi Di Muzio on 06/02/16.
//  Copyright © 2016 Luigi Di Muzio. All rights reserved.
//

import Foundation

struct GitHubRepository {
    let name: String
    let description: String
    let language: String
    let url: NSURL
    let stars: Int
    
    init?(dictionary: NSDictionary) {
        guard let
            aName = dictionary["name"] as? String,
            aDescription = dictionary["description"] as? String,
            aLanguage = dictionary["language"] as? String,
            anURLString = dictionary["url"] as? String,
            anURL = NSURL(string: anURLString),
            aStarAmount = dictionary["stargazers_count"] as? Int
        else {
                return nil
        }
        
        name = aName
        description = aDescription
        language = aLanguage
        url = anURL
        stars = aStarAmount
    }
}