//
//  GitHubClientTests.swift
//  GitHubClientTests
//
//  Created by Luigi Di Muzio on 06/02/16.
//  Copyright © 2016 Luigi Di Muzio. All rights reserved.
//

import XCTest
@testable import GitHubClient

class GitHubServiceTests: XCTestCase {
    
    let service = GitHubService()
    
    func testThatItReturnsAtLeastOneRepo() {
        // This is an example of a functional test case.
        let expectation = expectationWithDescription("Completion called")
        service.fetchSwiftTrendingRepositories {
            repositories in
            expectation.fulfill()
            XCTAssertTrue(repositories.count > 0)
        }
        self.waitForExpectationsWithTimeout(10.0, handler:nil)
    }
    
    func testThatItReturnsOnlyReposForSwiftLanguage() {
        // This is an example of a functional test case.
        let expectation = expectationWithDescription("Completion called")
        service.fetchSwiftTrendingRepositories {
            repositories in
            expectation.fulfill()
            let notSwiftRepos = repositories.filter { repo in repo.language != "Swift" }
            XCTAssertTrue(notSwiftRepos.count == 0)
        }
        self.waitForExpectationsWithTimeout(10.0, handler:nil)
    }
    
    func testThatItReturnsReposOrderedByStarsDescending() {
        let expectation = expectationWithDescription("Completion called")
        service.fetchSwiftTrendingRepositories {
            repositories in
            expectation.fulfill()
            var reposAreSorted = true
            for i in 1..<repositories.count {
                if repositories[i-1].stars < repositories[i].stars {
                    reposAreSorted = false
                    break
                }
            }
            XCTAssertTrue(reposAreSorted)
        }
        self.waitForExpectationsWithTimeout(10.0, handler:nil)
    }

}
