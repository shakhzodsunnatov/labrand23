//
//  ServiceResponse.swift
//  Labrand
//
//  Created by Shakhzod on 24/09/22.
//

import UIKit
import SwiftyJSON


typealias ServiceResponse = (_ result: ServiceResponseResult<JSON>) -> Void

enum ServiceResponseResult <T> {
    case success(T)
    case failure(ApiResponseError, T?)
}
