//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

public protocol IdentifierSource {
    var type: String { get set }
    func identifier() -> String?
}
