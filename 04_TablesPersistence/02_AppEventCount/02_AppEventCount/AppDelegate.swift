//
//  AppDelegate.swift
//  02_AppEventCount
//
//  Created by 전율 on 2023/12/05.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var viewController:ViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        viewController = window?.rootViewController as? ViewController
        viewController?.launchCount += 1
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        viewController?.becomeActiveCount += 1
        viewController?.updateView()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        viewController?.resignActiveCount += 1
        viewController?.updateView()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        viewController?.didEnterBkCount += 1
        viewController?.updateView()
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        viewController?.willEnterFrgCount += 1
        viewController?.updateView()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        viewController?.willTerminateCount += 1
        viewController?.updateView()
    }
}
