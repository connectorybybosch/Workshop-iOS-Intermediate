//
//  ApiService.swift
//  WorkshopiOSVsAndroid
//
//  Created by Daniel Reyes Sánchez on 26/03/18.
//  Copyright © 2018 Daniel Reyes Sánchez. All rights reserved.
//

import Foundation
import Alamofire

class ApiService {
    
    static let sharedInstance = ApiService()
    private let url = "https://thawing-waters-35250.herokuapp.com/workshop"
    
    
    
    func getXDKData(_ success:@escaping ([Measure]) -> Void,
                    _ failure:@escaping (String) -> Void) {
        
        Alamofire.request(url, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            
            guard response.result.isSuccess else {
                failure(response.result.error?.localizedDescription ?? "Error")
                return
            }
            
            guard let data = response.result.value else { failure("Error"); return }
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                let measures = try JSONDecoder().decode([Measure].self , from: jsonData)
                success(measures)
            } catch let error{
                failure(error.localizedDescription)
            }
        }
    }
    
}

