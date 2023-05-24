//
//  LikeButton.swift
//  Labrand
//
//  Created by Shakhzod on 03/10/22.
//

import UIKit

class LikeButton: UIButton {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        
        let heartFill = UIImage(systemName: "heart.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        let heart = UIImage(systemName: "heart")?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        
        setImage(heart, for: .normal)
        setImage(heartFill, for: .selected)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .heartBg
        
        layer.cornerRadius = self.frame.size.height / 2
        layer.shadowColor = UIColor.shadowColor.withAlphaComponent(0.5).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 3)
    }
}
