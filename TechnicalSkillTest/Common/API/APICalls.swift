//
//  APICalls.swift
//  TechnicalSkillTest
//
//  Created by Juan Colilla on 13/10/21.
//

import Foundation

class APICalls {
    
    private let session = URLSession.shared
    
    static let shared = APICalls()
    
    private init() {}
    
    enum API_URL: String {
        case getGroups = "https://practica-slashmobility.firebaseio.com/groups.json"
        
    }
    
    func callAPI(endpoint: API_URL, parameters: [String : String], completion: @escaping (Data) -> ()) {
        
        guard let url = URL(string: endpoint.rawValue) else { return }
        
        var request: URLRequest = URLRequest(url: url)
        
        // Call Type
        request.httpMethod = "GET"
        
        // Parameters
        request.allHTTPHeaderFields = parameters
        //        request.allHTTPHeaderFields = ["Accept" : "application/json"]
        //        request.allHTTPHeaderFields = ["lang" : "es"]
        
        // Call
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                return
            }
            guard let data = data else {
                return
            }
            
            
            
            // Call Result Decode
            //self.movies = try self.decoder.decode([IMDBMovie].self, from: data)
            
#if DEBUG
            print(String(data: data, encoding: .utf8) as Any)
#endif
            
            completion(data)
            
        }
        task.resume()
    }
    
}
