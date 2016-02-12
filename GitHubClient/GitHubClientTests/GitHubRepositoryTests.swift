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
    
    var aValidRepoDictionary: [String: AnyObject] = Dictionary()
    
    override func setUp() {
        aValidRepoDictionary = [
            "name": "GitHubClient",
            "description": "A cool GitHubClient",
            "language": "Swift",
            "stargazers_count": 2,
            "url": "https://github.com/luigidimuzio/GitHubClient"
        ]
    }
    
    func testThatItCanBeInitializedWithValidDictionary() {
        let testRepo = GitHubRepository(dictionary: aValidRepoDictionary)
        XCTAssertNotNil(testRepo)
    }
    
    func testThatItHasANameWhenInitializedWithValidDictionary() {
        let testRepo = GitHubRepository(dictionary: aValidRepoDictionary)
        XCTAssertNotNil(testRepo)
        XCTAssertEqual(testRepo!.name, "GitHubClient")
    }
    
    func testThatItHasADescriptionWhenInitializedWithValidDictionary() {
        let testRepo = GitHubRepository(dictionary: aValidRepoDictionary)
        XCTAssertNotNil(testRepo)
        XCTAssertEqual(testRepo!.description, "A cool GitHubClient")
    }
    
    func testThatItHasALanguageWhenInitializedWithValidDictionary() {
        let testRepo = GitHubRepository(dictionary: aValidRepoDictionary)
        XCTAssertNotNil(testRepo)
        XCTAssertEqual(testRepo!.language, "Swift")
    }
    
    func testThatItHasAStarNumberWhenInitializedWithValidDictionary() {
        let testRepo = GitHubRepository(dictionary: aValidRepoDictionary)
        XCTAssertNotNil(testRepo)
        XCTAssertEqual(testRepo!.stars, 2)
    }
    
    func testThatItHasAnURLWhenInitializedWithValidDictionary() {
        let testRepo = GitHubRepository(dictionary: aValidRepoDictionary)
        XCTAssertNotNil(testRepo)
        XCTAssertEqual(testRepo!.url, NSURL(string: "https://github.com/luigidimuzio/GitHubClient")!)
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
