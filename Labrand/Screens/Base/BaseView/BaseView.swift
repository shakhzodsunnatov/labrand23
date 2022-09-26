//
//  BaseView.swift
//  Labrand
//
//  Created by Shakhzod on 23/09/22.
//

import UIKit

class BaseView: UIView, LoaderView {

    //MARK: - Properties
    var emptyViewLoader: EmptyViewLoader?
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
