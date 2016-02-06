//
//  ViewController.swift
//  GitHubClient
//
//  Created by Luigi Di Muzio on 06/02/16.
//  Copyright © 2016 Luigi Di Muzio. All rights reserved.
//

import UIKit

let repoCellReuseIdentifier = "RepoCellReuseIdentifier"

class TrendingSwiftReposViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var trendingRepos: [GitHubRepository] = []
    
    let githubService = GitHubService()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: repoCellReuseIdentifier)
    }
    
    override func viewWillAppear(animated: Bool) {
        githubService.fetchSwiftTrendingRepositories { (fetchedRepos) -> Void in
            self.trendingRepos = fetchedRepos
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        }
    }

    //MARK: TableView Datasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendingRepos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(repoCellReuseIdentifier, forIndexPath: indexPath)
        let repo = trendingRepos[indexPath.row]
        cell.textLabel?.text = repo.name
        return cell
    }
}

