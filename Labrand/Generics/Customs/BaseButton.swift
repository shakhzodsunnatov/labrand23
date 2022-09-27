//
//  BaseButton.swift
//  Labrand
//
//  Created by Shakhzod on 26/09/22.
//

import UIKit

class BaseButton: Button {
    
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
        self.layer.shadowColor = UIColor.red.withAlphaComponent(0.2).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.font = UIFont.systemFont(ofSize: 14)
        self.titleColor = UIColor.white
    }
}

