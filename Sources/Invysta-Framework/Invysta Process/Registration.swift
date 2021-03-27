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
    
    override public func start(_ completion: @escaping (Result<Int, ServerError>) -> Void) {
        networkManager.call(invystaURL) { [weak self] (data, response, error) in
            
            guard let self = self else { return }
            
            if let error = error {
                completion(.failure(.error(error.localizedDescription)))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.error("An unknown error has occured")))
                return
            }
            
            InvystaService.log(.warning, "Status Code \(response.statusCode)")
            
            if response.statusCode == 201 {
                completion(.success(response.statusCode))
            } else if response.statusCode == 401 || response.statusCode == 400 {
                completion(.failure(.error(self.JSONError(data), response.statusCode)))
            } else {
                completion(.failure(.error("An unknown error has occured")))
            }
        }
    }
    
}
