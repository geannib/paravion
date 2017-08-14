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
    

    func getAllOffers( token:String, onCompletion: @escaping (Dictionary<String, Any>) -> Void){
        
        let route = baseURL + "/offers?token=" + "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6MjMsImV4cCI6MTUwMjcyNTQyOSwiY3JlYXRlZF9hdCI6MTUwMjY5NTQyOSwiY29udGV4dCI6eyJlbWFpbCI6ImRlbW8yQGdtYWlsLmNvbSIsImlzX2FkbWluIjpmYWxzZX19.5uuJaqYWDOgN4-MaDzrqhZATeN30YlGZEWsk4xRk5Vo"
        self.makeHTTPGetRequest(path: route, onCompletion: { json, err in
            onCompletion(json as Dictionary<String, Any>)
        })
    }

    
    func registerUser(postParams: [String: String], onCompletion: @escaping (Dictionary<String, Any>) -> Void){
        
        let route = baseURL + "/users"
        makeHTTPPostRequest(path: route, body: postParams, onCompletion: { json, err in
            onCompletion(json as Dictionary<String, Any>)
        })
    }
    
    
    // MARK: Perform a GET Request
    private func makeHTTPGetRequest(path: String, onCompletion: @escaping ServiceResponse) {
        let request = NSMutableURLRequest(url: NSURL(string: path)! as URL)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if data != nil {
                let returnData = String(data: data!, encoding: .utf8)
                let jsonData:Dictionary<String, AnyObject> = (returnData?.parseJSONString)! as! Dictionary<String, AnyObject>
                onCompletion(jsonData, nil)
            } else {
                onCompletion(Dictionary<String, Any>(), error! as NSError)
            }
        })
        task.resume()
    }
    
    // MARK: Perform a POST Request
    private func makeHTTPPostRequest(path: String, body: [String: String], onCompletion: @escaping ServiceResponse) {
        let request = NSMutableURLRequest(url: NSURL(string: path)! as URL)
        
        // Set the method to POST
        request.httpMethod = "POST"
        
        do {
            // Set the POST body for the request
            
            var paramsStr = ""
            let keys = body.keys
            for key in keys {
                let value = body[key];
                paramsStr = String(format:"%@&%@=%@", paramsStr, key, value!)
            }
            request.httpBody =  paramsStr.data(using: .utf8)
            let session = URLSession.shared
            
            let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
                if data != nil {
                    let returnData = String(data: data!, encoding: .utf8)
                    let jsonData:Dictionary<String, AnyObject> = (returnData?.parseJSONString)! as! Dictionary<String, AnyObject>
//                    let json = Dictionary<String, Any>()
                    onCompletion(jsonData, nil)
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

extension String
{
    var parseJSONString: AnyObject?
    {
        let data = self.data(using: String.Encoding.utf8, allowLossyConversion: false)
        if let jsonData = data
        {
            // Will return an object or nil if JSON decoding fails
            do
            {
                let message = try JSONSerialization.jsonObject(with: jsonData, options:.mutableContainers)
                if let jsonResult = message as? NSMutableArray {
                    return jsonResult //Will return the json array output
                } else if let jsonResult = message as? NSMutableDictionary {
                    return jsonResult //Will return the json dictionary output
                } else {
                    return nil
                }
            }
            catch let error as NSError
            {
                print("An error occurred: \(error)")
                return nil
            }
        }
        else
        {
            // Lossless conversion of the string was not possible
            return nil
        }
    }
}
