//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

open class Authenticate: InvystaProcess<AuthenticationObject> {
   
    public override init(_ invystaObject: InvystaObject, _ networkManager: NetworkManager = NetworkManager()) {
        super.init(invystaObject, networkManager)
    }
    
    override public func start(_ completion: @escaping (InvystaResult) -> Void) {
        guard let _ = URL(string: invystaURL.object.provider) else {
            completion(.failure("Invalid Provider", -1))
            return
        }
        
        networkManager.call(invystaURL) { [weak self] (data, response, error) in
            
            guard let self = self else { return }
            
            if let error = error {
                completion(.failure(error.localizedDescription, -1))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(self.JSONError(data), -1))
                return
            }
            
            InvystaService.log(.warning, "Status Code \(response.statusCode)")
            
            if response.statusCode == 201 {
                completion(.success(response.statusCode))
            } else {
                completion(.failure(self.JSONError(data), response.statusCode))
            }
        }
    }
    
}
