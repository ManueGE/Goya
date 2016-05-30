//
//  UIResponder+Styles.swift
//  goya
//
//  Created by Manu on 30/5/16.
//  Copyright © 2016 manuege. All rights reserved.
//

import UIKit
import ObjectiveC

private var StyleKey: UInt8 = 0
private var StyleNameKey: UInt8 = 0

extension UIResponder {
    
    /// The current style of the responder, if any
    public var gy_style: AbstractStyle? {
        get {
            return objc_getAssociatedObject(self, &StyleKey) as? AbstractStyle
        }
        
        set {
            if let style = newValue {
                style.apply(self)
            }
            objc_setAssociatedObject(self, &StyleKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    /// The current style name of the responder, if any
    public var gy_styleName: String? {
        get {
            if let name = objc_getAssociatedObject(self, &StyleNameKey) as? String {
                return name
            }
            
            return self.gy_style?.registerName
        }
        
        set {
            objc_setAssociatedObject(self, &StyleKey, newValue, .OBJC_ASSOCIATION_RETAIN)
            
            guard let styleName = newValue else {
                return
            }
            
            guard let style = registeredStyle(withName: styleName) else {
                assert(false, "No registered style with name \(styleName)")
            }
            
            self.gy_style = style
        }
    }
}
