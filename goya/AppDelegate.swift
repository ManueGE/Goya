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
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let parent = Style { (view: UIView) -> Void in
            view.backgroundColor = UIColor.blackColor()
        }
        parent.register("parent")
        
        Style(parent: parent) { (label: UILabel) -> Void in
            label.textColor = UIColor.redColor()
            label.font = UIFont.systemFontOfSize(50)
            }.register("style")
        
        Style { (label: UILabel) -> Void in
            label.backgroundColor = UIColor.clearColor()
            label.textColor = UIColor.blueColor()
            label.font = UIFont.systemFontOfSize(50)
            }.register("alterStyle")
        
        
        Style(parent: parent) { (button: UIButton) -> Void in
            button.titleLabel?.font = UIFont.systemFontOfSize(50)
            }.register("button")
        
        return true
    }
}

