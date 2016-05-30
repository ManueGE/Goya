//
//  UIResponder+Inspectable.swift
//  goya
//
//  Created by Manu on 30/5/16.
//  Copyright © 2016 manuege. All rights reserved.
//

import UIKit

/**
 This extenstion is provided to allow the *IBInspectable* feature
 */
extension UIResponder {
    
    /// set the style name. This should only be used from interface builder In other cases, pleae use `gy_styleName`
    @IBInspectable public var styleName: String? {
        get {
            return self.gy_styleName
        }
        
        set {
            self.gy_styleName = newValue
        }
    }
}