//
//  AppDelegate.swift
//  project1
//
//  Created by Дмитрий Матвеенко on 16.06.2018.
//  Copyright © 2018 Дмитрий Матвеенко. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Thread.sleep(forTimeInterval: 0.5)
    
        // Override point for customization after application launch.
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let splitViewController = mainStoryboard.instantiateViewController(withIdentifier: "StartSplitViewController") as! UISplitViewController
        UIApplication.shared.keyWindow?.rootViewController = splitViewController

        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController

        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
        

        let tabBarViewController = self.window!.rootViewController as! UITabBarController
        //var splitViewController: UISplitViewController? = nil
        for viewController in tabBarViewController.viewControllers! {
            if viewController.title == "Detail" {
                _ = viewController as? UISplitViewController
            }
        }
        
        return true
    }


    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    // MARK: - Split view
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? StartDetailViewController else { return false }
        if topAsDetailController.girlName == "" {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
           return true
        }
        return true
    }
}
