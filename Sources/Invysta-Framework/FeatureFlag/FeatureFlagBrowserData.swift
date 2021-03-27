//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

protocol FeatureFlagType {
    var trigger: Bool { get }
    func check() -> Any?
}

open class FeatureFlag {
    static var showDebuggingTextField: Bool = false
    static var mockSuccessLabel: Bool = false
}

open class FeatureFlagBrowserData: FeatureFlagType {
    
    var trigger: Bool = false
    
    func hookbin() -> String? {
        return trigger ? "https://hookb.in/3OJrRD9wV0fEwwjBWa7y" : nil
    }
    
    func check() -> Any? {
        if trigger {
            return InvystaBrowserDataModel(action: "log",
                               uid: "encData",
                               nonce: "magicVal")
        }
        return nil
    }
}
