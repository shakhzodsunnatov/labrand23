//
//  BaseLoadingButton.swift
//  Labrand
//
//  Created by Shakhzod on 27/09/22.
//

import UIKit

class BaseLoadingButton: LoadingButton {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(Coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        color = .appColor(.redPrimary)
        fontSize = 14
        heightAdditional = 48
    }
    
    private func setup() {
        self.layer.shadowColor = UIColor.red.withAlphaComponent(0.3).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.font = UIFont.systemFont(ofSize: 14)
        self.titleColor = UIColor.white
    }
    
}
