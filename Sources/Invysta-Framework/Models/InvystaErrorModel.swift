//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

public struct InvystaErrorModel: Decodable {
    var error: String
    var errors: [InvystaErrorDetails]?
}

public struct InvystaErrorDetails: Decodable {
    var location: String
    var msg: String
    var param: String
    var value: String
}
