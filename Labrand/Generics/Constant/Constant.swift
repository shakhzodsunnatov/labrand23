//
//  Constant.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import UIKit

// MARK: - Devices
let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
let SCREEN_MAX_LENGTH    = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH    = min(SCREEN_WIDTH, SCREEN_HEIGHT)

let IS_IPHONE            = UIDevice.current.userInterfaceIdiom == .phone

let IS_IPHONE_4_OR_LESS       = IS_IPHONE && SCREEN_MAX_LENGTH < 568.0
let IS_IPHONE_5_S_SE          = IS_IPHONE && SCREEN_MAX_LENGTH == 568.0
let IS_IPHONE_6_7_8           = IS_IPHONE && SCREEN_MAX_LENGTH == 667.0
let IS_IPHONE_6_6S_7_8_PLUS   = IS_IPHONE && SCREEN_MAX_LENGTH == 736.0
let IS_IPHONE_X_AND_UPPER     = IS_IPHONE && SCREEN_MAX_LENGTH >= 812.0
let IS_IPHONE_X_XS            = IS_IPHONE && SCREEN_MAX_LENGTH == 812.0
let IS_IPHONE_XR_XSMAX        = IS_IPHONE && SCREEN_MAX_LENGTH >= 896.0

// MARK: - AppDelegate
let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate

