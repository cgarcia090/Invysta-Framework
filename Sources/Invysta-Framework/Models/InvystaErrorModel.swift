//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

public struct InvystaErrorModel: Decodable {
    public var error: String
    public var errors: [InvystaErrorDetails]?
}

public struct InvystaErrorDetails: Decodable {
    public var location: String
    public var msg: String
    public var param: String
    public var value: String
}
