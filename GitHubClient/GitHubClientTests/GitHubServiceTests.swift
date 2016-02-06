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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
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
