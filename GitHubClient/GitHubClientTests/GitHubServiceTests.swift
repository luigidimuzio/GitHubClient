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
        let expectation = expectationWithDescription("Completion called")
        service.fetchSwiftTrendingRepositories { result in
            if case let .Success(repositories) = result {
                XCTAssert(repositories.count > 0)
                expectation.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(10.0, handler:nil)
    }
    
    func testThatItReturnsOnlyReposForSwiftLanguage() {
        let expectation = expectationWithDescription("Completion called")
        service.fetchSwiftTrendingRepositories { result in
            if case let .Success(repositories) = result {
                var reposAreSorted = true
                for i in 1..<repositories.count {
                    if repositories[i-1].stars < repositories[i].stars {
                        reposAreSorted = false
                        break
                    }
                }
                XCTAssertTrue(reposAreSorted)
            expectation.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(10.0, handler:nil)
    }
    
    func testThatItReturnsReposOrderedByStarsDescending() {
        let expectation = expectationWithDescription("Completion called")
        service.fetchSwiftTrendingRepositories { result in
            if case let .Success(repositories) = result {
                let notSwiftRepos = repositories.filter { repo in repo.language != "Swift" }
                XCTAssertTrue(notSwiftRepos.count == 0)
                expectation.fulfill()
            }
        }
        self.waitForExpectationsWithTimeout(10.0, handler:nil)
    }
}
