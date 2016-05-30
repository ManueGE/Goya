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
    
    @IBInspectable public var styleName: String? {
        get {
            return self.gy_styleName
        }
        
        set {
            self.gy_styleName = newValue
        }
    }
}