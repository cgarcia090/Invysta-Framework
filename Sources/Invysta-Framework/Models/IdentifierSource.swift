//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation
import CommonCrypto

public protocol IdentifierSource {
    var type: String { get set }
    func identifier() -> String?
    func SHA256(data: Data?) -> String
}

extension IdentifierSource {
    public func SHA256(data: Data?) -> String {
        guard let data = data else { return "SHA-err" }
        var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA256($0.baseAddress, CC_LONG(data.count), &hash)
        }
        
        return Data(hash).map { String(format: "%02hhx", $0) }.joined()
    }
}
