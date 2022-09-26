//
//  ApiServiceProtocol.swift
//  Labrand
//
//  Created by Shakhzod on 24/09/22.
//

import UIKit
import Alamofire

protocol ApiServiceProtocol {
    
    func GET(endpoint: String, parameters: Parameters?, headers: HTTPHeaders?, completion:@escaping ServiceResponse)
    
    func POST(endpoint: String, parameters: Parameters?, encoding: ParameterEncoding?, headers: HTTPHeaders?, completion:@escaping ServiceResponse)
    
    func PATCH(endpoint: String, parameters: Parameters?, headers: HTTPHeaders?, completion:@escaping ServiceResponse)
    
    func PUT(endpoint: String, parameters: Parameters?, headers: HTTPHeaders?, completion: @escaping ServiceResponse)
    
    func DELETE(endpoint: String, parameters: Parameters?, headers: HTTPHeaders?, completion:@escaping ServiceResponse)

    // Common
    func request(method: HTTPMethod, endpoint: String, parameters: Parameters?, encoding: ParameterEncoding?, headers: HTTPHeaders?, completion:@escaping ServiceResponse)
    
    func requestMultipartData(endpoint: String, header: HTTPHeaders?, multipart: @escaping (MultipartFormData) -> Void, encoding: ParameterEncoding? , completion:@escaping ServiceResponse)
}

