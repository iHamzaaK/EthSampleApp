//
//  BaseRepository.swift
//  EthSampleApp
//
//  Created by Hamza Khan on 13/02/2020.
//  Copyright © 2020 Hamza Khan. All rights reserved.
//

import Foundation
enum ServiceRequestType{
    case get
    case post
    func getRequestType()->String{
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}
class BaseRepository{
    static var instance : BaseRepository = BaseRepository()
    private init(){}
    
    func request(headers : [String:String], params : [String:Any], requestType : ServiceRequestType, url : String, completionHandler: @escaping (_ success : Bool , _ message : String , _ data: Data?)->()){
        
        let postData = try! JSONSerialization.data(withJSONObject: params, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = requestType.getRequestType()
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if (error != nil) {
                guard let error = error else { return }
                completionHandler(false, error.localizedDescription, nil)
            } else {
                let httpResponse = response as? HTTPURLResponse
                if httpResponse?.statusCode == 200 {
                    if let data = data {
                        completionHandler(true, "", data)
                        
                    }
                }
                else{
                    completionHandler(false, "Error with response", nil)
                }
            }
        })
        
        dataTask.resume()
    }
}
