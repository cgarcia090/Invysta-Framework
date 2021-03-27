//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

public struct InvystaBrowserDataModel {
    var action: String
    var uid: String
    var nonce: String

    var see: String {
        return """
            action: \(action)
            uid: \(uid)
            nonce: \(nonce)
            """
    }
}
