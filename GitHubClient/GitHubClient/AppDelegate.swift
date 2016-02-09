//
//  AppDelegate.swift
//  GitHubClient
//
//  Created by Luigi Di Muzio on 06/02/16.
//  Copyright © 2016 Luigi Di Muzio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        GitHubService().fetchSwiftTrendingRepositories({repos in return})
        return true
    }
}

