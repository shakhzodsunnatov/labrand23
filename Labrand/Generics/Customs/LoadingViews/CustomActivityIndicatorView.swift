//
//  CustomActivityIndicatorView.swift
//  Labrand
//
//  Created by Shakhzod on 23/09/22.
//

import UIKit
import SnapKit

class CustomActivityIndicatorView: UIActivityIndicatorView {

    override init(style: UIActivityIndicatorView.Style) {
        super.init(style: style)
        
        if #available(iOS 12.0, *),
           self.traitCollection.userInterfaceStyle == .dark {
            color = .white
        } else {
            color = .gray
        }
        startAnimating()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showLoader() {
        self.isHidden = false
    }
    
    func hideLoader() {
        self.isHidden = true
    }
    
    class func createSpinnerToCenter(view: UIView) -> CustomActivityIndicatorView {
        let spinner = CustomActivityIndicatorView(style: .large)
        
        view.addSubview(spinner)
        
        spinner.snp.makeConstraints
            { (make) in
                make.centerX.equalToSuperview()
                make.centerY.equalTo(view.snp.centerY)
        }
        
        return spinner
    }
}

class EmptyViewLoader {
    
    fileprivate(set) var loaderView: UIView!
    fileprivate var activityIndicator: CustomActivityIndicatorView!
    fileprivate var topPadding: CGFloat?
    
    
    init(rootView: UIView, parentView: UIView, backgroundColor: UIColor = .systemGroupedBackground) {
        setupView(rootView, parentView, backgroundColor)
    }
    
    
    init(rootView: UIView, parentView: UIView, backgroundColor: UIColor = .systemGroupedBackground, topPadding: CGFloat) {
        self.topPadding = topPadding
        setupView(rootView, parentView, backgroundColor)
    }
    
    
    func showLoaderView(_ value: Bool) {
        isHiddenLoaderView(!value)
        value ? activityIndicator.showLoader() : hideLoader()
    }
    
    
    func isHiddenLoaderView(_ value: Bool) {
        loaderView.isHidden = value
    }
    
    
    func hideLoader() {
        activityIndicator.hideLoader()
    }
    
    
    fileprivate func setupView(_ rootView: UIView, _ parentView: UIView, _ backgroundColor: UIColor) {
        loaderView = UIView()
        loaderView.backgroundColor = backgroundColor
        
        rootView.addSubview(loaderView)
        loaderView.snp.makeConstraints { make in
//            make.top.equalTo(rootView.safeTop)
//            make.left.bottom.right.equalToSuperview()
            make.edges.equalTo(parentView)
        }
        
        if let topPadding = topPadding {
            let spinner = CustomActivityIndicatorView(style: .large)
            
            loaderView.addSubview(spinner)
            spinner.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.centerY.equalTo(loaderView.snp.centerY).offset(topPadding)
            }
            
            activityIndicator = spinner
        }
        else {
            activityIndicator = CustomActivityIndicatorView.createSpinnerToCenter(view: loaderView)
        }
    }
}
