//
//  Style.swift
//  goya
//
//  Created by Manu on 30/5/16.
//  Copyright © 2016 manuege. All rights reserved.
//

import UIKit

private var RegisteredStyles: [String: AbstractStyle] = [:]

public protocol AbstractStyle: AnyObject {
    var registerName: String? { get set }
    func apply(object: AnyObject)
}

/**
 - returns: the registered style with the given name, nil if does not exist any registered style for this name
 */
public func registeredStyle(withName name: String) -> AbstractStyle? {
    guard let style = RegisteredStyles[name] else {
        return nil
    }
    return style
}

public extension AbstractStyle {

    // MARK: Register
    /**
     Register the style with the given key
     - parameter name: the name to register the style
     */
    public func register(name: String) {
        self.registerName = name
        RegisteredStyles[name] = self
    }
    
    /**
     Unregister the style 
     */
    public func unregister() {
        guard let name = self.registerName else {
            return
        }
        
        guard let style = registeredStyle(withName: name) else {
            return
        }
        
        guard style === self else {
            return
        }
        
        self.registerName = nil
        RegisteredStyles[name] = nil
    }
    
}

public class Style<T: UIResponder>: NSObject, AbstractStyle {
    
    ///If set, instances will call the `configurationBlock`of it parents before call its own block
    public let parent: AbstractStyle?
    
    ///the block used to configure the items when the style is applied
    public let configurator: (T)->Void
    
    public var registerName: String?
    
    // MARK: Init
    public init(parent: AbstractStyle? = nil, configurator: (T)->Void) {
        self.configurator = configurator
        self.parent = parent
        super.init()
    }
    
    // MARK: Apply
    /**
     Apply the style into the given responder
     - parameter responder: the object to apply the style in
     */
    public func apply(responder: T) {
        if let parent = parent {
            parent.apply(responder)
        }
        
        configurator(responder)
    }
    
    /**
     Apply the style into the given object. If the style is not applicable in the object, it will launch a fatal error
     - parameter object: the object to apply the style in
     */
    public func apply(object: AnyObject) {
        guard let responder = object as? T else {
            let name = self.registerName ?? self.description
            fatalError("Style \"\(name)\" cannot be applied to \(object)")
        }
        
        apply(responder)
    }
}
