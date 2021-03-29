//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

protocol FeatureFlagType {
    var trigger: Bool { get }
    var testVal: Any? { get set }
}

open class FeatureFlag {
    static var showDebuggingTextField: Bool = false
    static var mockSuccessLabel: Bool = false
}

open class FeatureFlagBrowserData: FeatureFlagType {
    
    public var trigger: Bool = false
    public var testVal: Any?
    
    static public let shared = FeatureFlagBrowserData()
}
