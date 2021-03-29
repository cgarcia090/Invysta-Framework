//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation
import CommonCrypto

open class IdentifierManager {
    
    public static let shared: IdentifierManager = IdentifierManager()
    
    public private(set) var compiledSources: [String] = []
    public private(set) var clientAgentId: String = ""
    
    private var sources: [IdentifierSource]! {
        didSet {
            compiledSources = self.sources.compactMap({ $0.identifier() })
            InvystaService.log(.alert,"\(type(of: self))", "Sources Finished Set \(compiledSources.count), \(compiledSources)")
        }
    }
       
    public static func configure(_ sources: [IdentifierSource]) {
        InvystaService.log(.alert,"\(type(of: self))", "IdentifierManager Configured")
        self.shared.sources = sources
        self.shared.createClientAgentId()
    }
    
    public init() {
        InvystaService.log(.alert,"\(type(of: self))", "Shared Called")
    }

    private func createClientAgentId() {
        InvystaService.log(.alert, "\(type(of: self))", "Creating Client Agent")
        var caid = ""
        clientAgentId = ""
        
        if let firstIdentifier = sources.first?.identifier() {
            caid += firstIdentifier
        }
        
        if let lastIdentifier = sources.last?.identifier() {
            caid += lastIdentifier
        }
        
        clientAgentId = SHA256(data: caid.data(using: .ascii))
    }
    
    private func SHA256(data: Data?) -> String {
        guard let data = data else { return "SHA-err" }
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
        }
        
        return Data(hash).map { String(format: "%02hhx", $0) }.joined()
    }
    
}
