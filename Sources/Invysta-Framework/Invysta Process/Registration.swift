//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

public final class Registration: InvystaProcess<RegistrationObject> {
    
    public override init(_ invystaObject: InvystaObject, _ networkManager: NetworkManager = NetworkManager()) {
        super.init(invystaObject, networkManager)
    }
    
    override public func start(_ completion: @escaping (InvystaResult) -> Void) {
        
        guard let _ = URL(string: invystaURL.object.provider) else {
            completion(.failure("Invalid Provider", -1))
            return
        }
        
        var url = invystaURL
        url.object.provider += "/reg-device"
        
        print("###################################")
        print("REGISTRAITON")
        print("CAID",url.object.caid)
        print("Identifiers",url.object.identifiers)
        print("###################################")
        
        networkManager.call(url) { [weak self] (data, response, error) in
            
            guard let self = self else { return }
            
            if let error = error {
                completion(.failure(error.localizedDescription, -1))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(self.JSONError(data), -1))
                return
            }
            
            InvystaService.log(.warning,"\(type(of: self))", "Status Code \(response.statusCode)")
            
            if response.statusCode == 201 {
                completion(.success(response.statusCode))
            } else {
                completion(.failure(self.JSONError(data), response.statusCode))
            }
        }
    }
    
}
