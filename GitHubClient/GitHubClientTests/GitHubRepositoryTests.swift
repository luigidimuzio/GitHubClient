//
//  GitHubRepositoryTests.swift
//  GitHubClient
//
//  Created by Luigi Di Muzio on 06/02/16.
//  Copyright © 2016 Luigi Di Muzio. All rights reserved.
//

import XCTest
@testable import GitHubClient

class GitHubRepositoryTests: XCTestCase {
    
    func testThatItCanBeInitializedWithValidDictionary() {
        
        let aValidRepoDictionary = [
            "name": "GithubClient",
            "description": "A cool GitHubClient",
            "language": "Swift",
            "stargazers_count": 2,
            "url": "https://github.com/luigidimuzio/GitHubClient"
        ]
        let testRepo = GitHubRepository(dictionary: aValidRepoDictionary)
        XCTAssertNotNil(testRepo)
    }
    
    func testThatItCantBeInitializedWithDictionaryThatIsMissingRepoName() {
        
        let anInvalidRepoDictionary = [
            "description": "A cool GitHubClient",
            "language": "Swift",
            "stargazers_count": 2,
            "url": "https://github.com/luigidimuzio/GitHubClient"
        ]
        let testRepo = GitHubRepository(dictionary: anInvalidRepoDictionary)
        XCTAssertNil(testRepo)
    }
    
    func testThatItCantBeInitializedWithDictionaryThatIsMissingRepoStars() {
        
        let anInvalidRepoDictionary = [
            "name": "GithubClient",
            "description": "A cool GitHubClient",
            "language": "Swift",
            "url": "https://github.com/luigidimuzio/GitHubClient"
        ]
        let testRepo = GitHubRepository(dictionary: anInvalidRepoDictionary)
        XCTAssertNil(testRepo)
    }

    func testThatItCantBeInitializedWithDictionaryThatIsMissingRepoDescription() {
        
        let anInvalidRepoDictionary = [
            "name": "GithubClient",
            "language": "Swift",
            "stargazers_count": 2,
            "url": "https://github.com/luigidimuzio/GitHubClient"
        ]
        let testRepo = GitHubRepository(dictionary: anInvalidRepoDictionary)
        XCTAssertNil(testRepo)
    }
    
    func testThatItCantBeInitializedWithDictionaryThatIsMissingRepoLanguage() {
        
        let anInvalidRepoDictionary = [
            "name": "GithubClient",
            "description": "A cool GitHubClient",
            "stargazers_count": 2,
            "url": "https://github.com/luigidimuzio/GitHubClient"
        ]
        let testRepo = GitHubRepository(dictionary: anInvalidRepoDictionary)
        XCTAssertNil(testRepo)
    }
    
    func testThatItCantBeInitializedWithDictionaryThatIsMissingRepoURL() {
        
        let anInvalidRepoDictionary = [
            "name": "GithubClient",
            "description": "A cool GitHubClient",
            "language": "Swift",
            "stargazers_count": 2,
        ]
        let testRepo = GitHubRepository(dictionary: anInvalidRepoDictionary)
        XCTAssertNil(testRepo)
    }
    
}
