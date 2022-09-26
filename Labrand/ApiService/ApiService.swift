//
//  ApiService.swift
//  Labrand
//
//  Created by Shakhzod on 24/09/22.
//

import Foundation
import SwiftyJSON
import Alamofire

public typealias Parameters = [String : Any]


class ApiService: NSObject, ApiServiceProtocol
{
    
    static let shared = ApiService()
    
    // MARK: - Constants
    fileprivate lazy var sessionManager: Alamofire.Session = {
        var sessionManager = Alamofire.Session()
        let configuration = URLSessionConfiguration.default
        sessionManager = Alamofire.Session(configuration: configuration)
        return sessionManager
    }()
    
    // MARK: - Public
    func GET(endpoint: String, parameters: Parameters?, headers: HTTPHeaders?, completion:@escaping ServiceResponse) {
        return request(method: .get, endpoint: endpoint, parameters: parameters, encoding: JSONEncoding.default, headers: headers, completion: {result in
            completion(result)
        })
    }
    
    func POST(endpoint: String, parameters: Parameters?, encoding: ParameterEncoding?, headers: HTTPHeaders?, completion:@escaping ServiceResponse) {
        return request(method: .post, endpoint: endpoint, parameters: parameters, encoding: encoding ?? JSONEncoding.default, headers: headers, completion: { result in
            completion(result)
        })
    }
    
    func PATCH(endpoint: String, parameters: Parameters?, headers: HTTPHeaders?, completion: @escaping ServiceResponse) {
        return request(method: .patch, endpoint: endpoint, parameters: parameters, encoding: JSONEncoding.default, headers: headers, completion: { result in
            completion(result)
        })
    }
    
    func PUT(endpoint: String, parameters: Parameters?, headers: HTTPHeaders?, completion: @escaping ServiceResponse) {
        return request(method: .put, endpoint: endpoint, parameters: parameters, encoding: JSONEncoding.default, headers: headers, completion: { result in
            completion(result)
        })
    }
    
    func DELETE(endpoint: String, parameters: Parameters?, headers: HTTPHeaders?, completion: @escaping ServiceResponse) {
        return request(method: .delete, endpoint: endpoint, parameters: parameters, encoding: JSONEncoding.default, headers: headers, completion: { result in
            completion(result)
        })
    }
    
    // MARK: - Common
    func request(method: HTTPMethod, endpoint: String, parameters: Parameters?, encoding: ParameterEncoding?, headers: HTTPHeaders?, completion:@escaping ServiceResponse) {
        
        sessionManager.request(endpoint, method: method, parameters: parameters, encoding: encoding ?? URLEncoding.default, headers: headers)
            .responseData(completionHandler: { response in
                self.handler(responseData: response, completion: { result in
                    completion(result)
                })
            })
    }
    
    
    
    fileprivate func handler(responseData: AFDataResponse<Data>, completion:@escaping ServiceResponse) {
        switch responseData.result {
        case .success(let model):
            if let response = responseData.response {
                let statusCode = response.statusCode
                
                switch statusCode {
                case 200..<300:
                    completion(.success(JSON(model)))
//                    if let value = responseData.result.value {
//                        if JSON(value) != JSON.null {
//                            let json = JSON(value)
//
//                            completion(.success(json))
//                        } else {
//                            completion(.success(JSON()))
//                        }
//                    } else {
//                        let error = ApiResponseError(with: statusCode)
//                        completion(.failure(error, nil))
//                    }
    //                do {
    //                    let json = try JSON(data: data)
    //
    //                    completion(.success(json))
    //                } catch {
    //                    completion(.failure(ApiResponseError(with: statusCode), nil))
    //                }
                case 401: break
//                    NotificationManager.shared.post(name: .logout)
                case 403:break
//                    NotificationManager.shared.post(name: .userBlocked)
                case 400..<500: break
//                    completion(.failure(parseError(responseData: responseData), nil))
                default: break
    //                completion(.failure(ApiResponseError(with: statusCode), nil))
//                    completion(.failure(parseError(responseData: responseData), nil))
                }
            } else {
//                completion(.failure(parseError(responseData: responseData), nil))
            }
            
        case .failure(let error):
            completion(.failure(ApiResponseError(from: error), nil))
        }
    }
    
    func requestMultipartData(endpoint: String, header: Alamofire.HTTPHeaders?, multipart: @escaping (Alamofire.MultipartFormData) -> Void, encoding: Alamofire.ParameterEncoding?, completion: @escaping ServiceResponse) {}
    
//
//    fileprivate func parseError(responseData: AFDataResponse<Data>) -> ApiResponseError {
//        var error = ApiResponseError(with: responseData.response!.statusCode)
//
//        var description: String = ""
//
//        let data = responseData.response.data
//
//        if let value = responseData.result.value {
//            let responseJson = JSON(value)
//            if let v = responseJson["message"].string {
//                description = v
//            }
//            if let errors = responseJson["errors"].dictionary, let error_id = errors["error_id"]?.stringValue  {
//                error.error_id = error_id
//            }
//        }
//        if description.count == 0 {
//            description = "try_again".localized()
//        }
//
//        error.message = description
//
//        return error
//    }
}
