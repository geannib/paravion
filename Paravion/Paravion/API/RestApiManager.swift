//
//  RestApiManager.swift
//  Paravion
//
//  Created by Apple on 28/07/2017.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit


typealias ServiceResponse = (Dictionary<String, Any>, NSError?) -> Void

class RestApiManager: NSObject {
    static let sharedInstance = RestApiManager()
    
    let baseURL = "http://api.paravion.brandaffair.ro/v1"
    
    func getRandomUser(onCompletion: @escaping (Dictionary<String, Any>) -> Void) {
        let route = baseURL
        makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as Dictionary<String, Any>)
        })
    }
    
    // MARK: Perform a GET Request
    private func makeHTTPGetRequest(path: String, onCompletion: @escaping ServiceResponse) {
        let request = NSMutableURLRequest(url: NSURL(string: path)! as URL)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if data != nil {
                let json = Dictionary<String, Any>()
                onCompletion(json, error! as NSError)
            } else {
                onCompletion(Dictionary<String, Any>(), error! as NSError)
            }
        })
        task.resume()
    }
    
    // MARK: Perform a POST Request
    private func makeHTTPPostRequest(path: String, body: [String: AnyObject], onCompletion: @escaping ServiceResponse) {
        let request = NSMutableURLRequest(url: NSURL(string: path)! as URL)
        
        // Set the method to POST
        request.httpMethod = "POST"
        
        do {
            // Set the POST body for the request
            let jsonBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
            request.httpBody = jsonBody
            let session = URLSession.shared
            
            let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
                if data != nil {
                    let json = Dictionary<String, Any>()
                    onCompletion(json, nil)
                } else {
                    onCompletion(Dictionary<String, Any>(), error! as NSError)
                }
            })
            task.resume()
        } catch {
            // Create your personal error
            onCompletion(Dictionary<String, Any>(), nil)
        }
    }
}
