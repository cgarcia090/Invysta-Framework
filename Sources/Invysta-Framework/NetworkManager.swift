//
//  File.swift
//  
//
//  Created by Cyril Garcia on 3/27/21.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask<T: InvystaObject>(with url: InvystaURL<T>, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func dataTask<T>(with url: InvystaURL<T>, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol where T : InvystaObject {
        return dataTask(with: url.url, completionHandler: completion)
    }
}

protocol URLSessionDataTaskProtocol {
    func findUrl<T: InvystaObject>(_ url: InvystaURL<T>)
    func resume()
    func data(_ completion: (Data?, URLResponse?, Error?) -> Void)
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {
    func findUrl<T>(_ url: InvystaURL<T>) where T : InvystaObject {}
    func data(_ completion: (Data?, URLResponse?, Error?) -> Void) {}
}

open class NetworkManager {
    
    private var session: URLSessionProtocol?
    
    init(_ session: URLSessionProtocol? = nil) {
        if let session = session {
            self.session = session
        } else {
            let config = URLSessionConfiguration.default
            config.urlCache = nil
            config.urlCredentialStorage = nil
            config.httpCookieStorage = .none
            config.httpCookieAcceptPolicy = .never
            self.session = URLSession(configuration: config)
        }
    }
    
    public func call<T: InvystaObject>(_ url: InvystaURL<T>, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        session?.dataTask(with: url, completion: completion).resume()
    }
    
}
