//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

public protocol InvystaObject: Codable {
//    associatedtype String
    var provider: String { get set }
    var caid: String { get set }
    var identifiers: [String] { get set }
}

public struct RegistrationObject: InvystaObject {
    var email: String
    var password: String
    var otc: String
    public var caid: String
    public var provider: String
    public var identifiers: [String]
    
    public init(email: String, password: String, otc: String, provider: String) {
        self.email = email
        self.password = password
        self.otc = otc
        self.provider = provider
        self.caid = IdentifierManager.shared.clientAgentId
        self.identifiers = IdentifierManager.shared.compiledSources
    }
}

public struct AuthenticationObject: InvystaObject {
    public var uid: String
    public var nonce: String
    public var caid: String
    public var provider: String
    public var identifiers: [String]
    
    public init(uid: String, nonce: String, provider: String) {
        self.uid = uid
        self.nonce = nonce
        self.provider = provider
        self.caid = IdentifierManager.shared.clientAgentId
        self.identifiers = IdentifierManager.shared.compiledSources
    }
}
