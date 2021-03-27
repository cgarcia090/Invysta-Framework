//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

public protocol InvystaObject: Codable {
    associatedtype String
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
    
    public init(email: String, password: String, otc: String, caid: String, provider: String, identifier: [String]) {
        self.email = email
        self.password = password
        self.otc = otc
        self.caid = caid
        self.provider = provider
        self.identifiers = identifier
    }
}

public struct AuthenticationObject: InvystaObject {
    var uid: String
    var nonce: String
    public var caid: String
    public var provider: String
    public var identifiers: [String]
    
    public init(uid: String, nonce: String, caid: String, provider: String, identifier: [String]) {
        self.uid = uid
        self.nonce = nonce
        self.caid = caid
        self.provider = provider
        self.identifiers = identifier
    }
}
