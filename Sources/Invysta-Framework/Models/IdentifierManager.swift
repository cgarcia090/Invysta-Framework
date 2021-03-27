//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation
import CommonCrypto

open class IdentifierManager {
    
    private let sources: [IdentifierSource]
        
    public private(set) var compiledSources: [String] = []
    
    public init(_ sources: [IdentifierSource]) {
        self.sources = sources
        compiledSources = self.sources.compactMap({ $0.identifier() })
    }
    
    public func createClientAgentId() -> String {
        var caid = ""
        
        if let firstIdentifier = sources.first?.identifier() {
            caid += firstIdentifier
        }
        
        if let lastIdentifier = sources.last?.identifier() {
            caid += lastIdentifier
        }
        
        return SHA256(data: caid.data(using: .ascii))
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
