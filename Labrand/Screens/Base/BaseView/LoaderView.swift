//
//  LoaderView.swift
//  Labrand
//
//  Created by Shakhzod on 23/09/22.
//

import Foundation

protocol LoaderView: AnyObject {
    var emptyViewLoader: EmptyViewLoader? { get set }
    func showLoader(_ value: Bool)
}

extension LoaderView {
    func showLoader(_ value: Bool) {
        value ? emptyViewLoader?.showLoaderView(value) : emptyViewLoader?.hideLoader()
        emptyViewLoader?.isHiddenLoaderView(!value)
    }
}
