//
//  AppDelegate.swift
//  KaroooooCodeChallenge
//
//  Created by Sanjay on 15/12/22.
//

import UIKit
import IQKeyboardManagerSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window:UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        return true
    }
}

