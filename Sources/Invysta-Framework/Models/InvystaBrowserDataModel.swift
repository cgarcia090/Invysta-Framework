//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

public struct InvystaBrowserDataModel {
    public var action: String
    public var uid: String
    public var nonce: String
    
    public init(action: String, uid: String, nonce: String) {
        self.action = action
        self.uid = uid
        self.nonce = nonce
    }
    
    public var see: String {
        return """
            action: \(action)
            uid: \(uid)
            nonce: \(nonce)
            """
    }
}
