//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

public enum InvystaResult {
    case success(Int)
    case failure(String, Int)
}

open class InvystaProcess<T: InvystaObject> {
    
    let invystaURL: InvystaURL<T>
    let networkManager: NetworkManager

    public init(_ invystaObject: InvystaObject,_ url: String,_ networkManager: NetworkManager = NetworkManager()) {
        
        if invystaObject is AuthenticationObject {
            self.invystaURL = InvystaURL(object: invystaObject as! T, url: url + "/reg-login")
        } else if invystaObject is RegistrationObject {
            self.invystaURL = InvystaURL(object: invystaObject as! T, url: url + "/reg-device")
        } else {
            self.invystaURL = InvystaURL(object: invystaObject as! T, url: url)
        }
        
        self.networkManager = networkManager
    }
    
    public func start(_ completion: @escaping (InvystaResult) -> Void) {}
 
    public func JSONError(_ data: Data?) -> String {
        guard let data = data else {
            return "An unknwon error has occured"
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : String]
            
            return json?["error"] ?? "Unknown Error"
        } catch {
            return error.localizedDescription
        }
    }
}
