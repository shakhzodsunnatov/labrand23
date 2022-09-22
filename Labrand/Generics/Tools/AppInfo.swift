//
//  AppInfo.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit

struct AppInfo {
    
    static let Platform = "iOS"
    
    static func getOSVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    static func getAppVersionNumber() -> String
    {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    static func getAppEnvironment() -> String
    {
        #if DEBUG
        let environment = "development"
        #else
        let environment = "production"
        #endif
        
        return environment
    }
    
}
