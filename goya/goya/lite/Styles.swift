//
//  Style.swift
//  goya
//
//  Created by Manu on 30/5/16.
//  Copyright © 2016 manuege. All rights reserved.
//

import UIKit

// MARK: Registered styles

/// All the styles registered
private var RegisteredStyles: [String: AbstractStyle] = [:]

/**
 - returns: the registered style with the given name, nil if does not exist any registered style for this name
 */
public func registeredStyle(withName name: String) -> AbstractStyle? {
    guard let style = RegisteredStyles[name] else {
        return nil
    }
    return style
}

/**
 The common ancestor to all the generic styles
 */
public protocol AbstractStyle: AnyObject {
    ///The name used to register the style
    var registerName: String? { get set }
    
    /**
     Apply the style into the given object.
     - parameter object: the object to apply the style in
     */
    func apply(object: AnyObject)
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
     Unregister the style if already registered
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

/**
 AbstractStyle implementation aplicable to `UIResponder` subclasses
 */
public class Style<Type: UIResponder>: NSObject, AbstractStyle {
    
    ///If set, instances will call the `configurationBlock`of it parents before call its own block
    public let parent: AbstractStyle?
    
    ///The block used to configure the items when the style is applied
    public let configurator: (Type)->Void
    
    ///The name used to register the style
    public var registerName: String?
    
    // MARK: Init
    public init(parent: AbstractStyle? = nil, configurator: (Type)->Void) {
        self.configurator = configurator
        self.parent = parent
        super.init()
    }
    
    /**
     Apply the style into the given responder
     - parameter responder: the object to apply the style in
     */
    public func apply(responder: Type) {
        if let parent = parent {
            parent.apply(responder)
        }
        
        configurator(responder)
    }
    
    /**
     Apply the style into the given object. If the style is not applicable in the object, it will assert
     - parameter object: the object to apply the style in
     */
    public func apply(object: AnyObject) {
        guard let responder = object as? Type else {
            let name = self.registerName ?? self.description
            assert(false, "Style \"\(name)\" cannot be applied to \(object)")
            return
        }
        
        apply(responder)
    }
}
