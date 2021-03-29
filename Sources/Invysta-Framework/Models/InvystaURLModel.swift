//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

public struct InvystaURL<T: InvystaObject> {
    
    public var object: T
    public var url: String

    public var urlRequest: URLRequest {
        
        var providerUrl = url
        
        if let testVal = FeatureFlagBrowserData.shared.testVal {
            providerUrl = testVal as! String
        }
        
        InvystaService.log(.warning,"InvystaURL", providerUrl)
        InvystaService.log(.warning,"InvystaURL",  object.caid)
        
        var request = URLRequest(url: URL(string: providerUrl)!)
        
        do {
            let encoder = JSONEncoder()
            let encodedObject = try encoder.encode(object.self)
            request.httpBody = encodedObject
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            InvystaService.log(.error, "InvystaURL", error.localizedDescription)
        }
        
        return request
    }
    
    public init(object: T, url: String) {
        self.object = object
        self.url = url
    }
}
