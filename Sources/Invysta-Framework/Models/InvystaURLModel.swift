//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

public struct InvystaURL<T: InvystaObject> {
    
    var object: T
    
    var url: URLRequest {
        
        InvystaService.log(.warning, object.provider)
        InvystaService.log(.warning, object.caid)
        
        var request = URLRequest(url: URL(string: object.provider as! String)!)
        
        do {
            let encoder = JSONEncoder()
            let encodedObject = try encoder.encode(object.self)
            request.httpBody = encodedObject
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            InvystaService.log(.error, error.localizedDescription)
        }
        
        return request
    }
}