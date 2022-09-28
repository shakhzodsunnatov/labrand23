//
//  LoginProtocols.swift
//  Labrand
//
//  Created by Shakhzod on 24/09/22.
//

import Foundation

//MARK: - ViewController
protocol LoginPresentorOutput: AnyObject {
    
}

//MARK: - Interactable
protocol LoginInteractable: AnyObject {
    func nextButtonPressed()
}

//MARK: - Presentable
protocol LoginPresentable: AnyObject {
    
}

//MARK: - Routing
protocol LoginRouting: AnyObject {
    func openHome()
}
