//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

open class InvystaService {
    public static func reclaimedMemory<T>(_ cls: T) {
        Swift.print("")
        Swift.print("##########")
        Swift.print("Reclaimed memory")
        Swift.print("CLASS: \(type(of: cls))")
        Swift.print("##########")
        Swift.print("")
    }
    
    public enum EmojiType: String {
        case check = "✅"
        case error = "❌"
        case warning = "⚠️"
        case alert = "🚨"
    }

    public static func log(_ emoji: EmojiType, _ message: Any) {
        Swift.print("")
        Swift.print("########################################")
        Swift.print(emoji.rawValue, message)
        Swift.print("########################################")
        Swift.print("")
    }
    
}
