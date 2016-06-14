//
//  AppDelegate.swift
//  goya
//
//  Created by Manu on 30/5/16.
//  Copyright © 2016 manuege. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let parent = Style { (view: UIView) -> Void in
            view.backgroundColor = .black()
        }
        parent.register(withName: "parent")
        
        Style(parent: parent) { (label: UILabel) -> Void in
            label.textColor = .red()
            label.font = .systemFont(ofSize: 50)
            }.register(withName: "style")
        
        Style { (label: UILabel) -> Void in
            label.backgroundColor = .clear()
            label.textColor = .blue()
            label.font = .boldSystemFont(ofSize: 50)
            }.register(withName: "alterStyle")
        
        
        Style(parent: parent) { (button: UIButton) -> Void in
            button.titleLabel?.font = .systemFont(ofSize: 50)
            }.register(withName: "button")
        
        return true
    }
}

