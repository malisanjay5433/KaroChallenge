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
        // Override point for customization after application launch.
//        if #available(iOS 13.0, *) {
//            let standard = UINavigationBarAppearance()
//            standard.configureWithOpaqueBackground()
//
//            standard.backgroundColor = .systemPink
//            standard.titlePositionAdjustment = UIOffset(horizontal: -30, vertical: 0)
//            standard.titleTextAttributes = [.foregroundColor: UIColor.white]
//              
//            let button = UIBarButtonItemAppearance(style: .plain)
//            button.normal.titleTextAttributes = [.foregroundColor: UIColor.systemYellow]
//            standard.buttonAppearance = button
//              
//            let done = UIBarButtonItemAppearance(style: .done)
//            done.normal.titleTextAttributes = [.foregroundColor: UIColor.systemGreen]
//            standard.doneButtonAppearance = done
//              
//            UINavigationBar.appearance().standardAppearance = standard
//        } else {
//            // Fallback on earlier versions
//        }
//             
       
        IQKeyboardManager.shared.enable = true
        return true
    }
}

