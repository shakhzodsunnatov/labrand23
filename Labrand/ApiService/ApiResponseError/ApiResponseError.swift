//
//  ApiResponseError.swift
//  Labrand
//
//  Created by Shakhzod on 24/09/22.
//

import Foundation

struct ApiResponseError : Error {
    
    var error_code: Int = 0
    var message: String = ""
    var error_id: String?
    
    init(with statusCode: Int = 0, message: String = "try_again") {
        self.error_code = statusCode
        self.message = message
    }
    
    init(from error: Error) {
        self.error_code = error._code
        self.message = error.localizedDescription
    }
    
    var user_message: String? {
        debugPrint("ErrorCode: \(String(describing:self.error_code))\n" + "ErrorDescription: \(String(describing: self.message))")
        
        var value: String? = nil
        switch error_code {
        case ..<0:
            break
        case 0..<500:
            value = message
//        case -1001:
////            value = "request_timed_out".localized()
//            break
//        case -1020, -1005, -1009:
////            value = "net_connection_failed".localized()
//            break
        default:
            value = "try_again"//.localized()
        }
        
        return value
    }
}
