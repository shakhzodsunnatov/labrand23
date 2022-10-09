//
//  AspectRatio.swift
//  Labrand
//
//  Created by Shakhzod on 09/10/22.
//

import UIKit

enum AspectRatio {
    case seven_to_five
    case sixteen_to_nine
    case six_to_five
    case none
    
    
    static func onMeasure(width: CGFloat, ratio: AspectRatio = .none) -> CGSize {
        var ratioWidth: CGFloat = 1
        var ratioHeight: CGFloat = 1
        
        switch ratio {
        case .seven_to_five:
            ratioWidth = 7
            ratioHeight = 5
        case .six_to_five:
            ratioWidth = 6
            ratioHeight = 5
        case .sixteen_to_nine:
            ratioWidth = 16
            ratioHeight = 9
        default: break
        }
        
        let measuredHeight = (width * ratioHeight / ratioWidth)
        
        return CGSize(width: width, height: measuredHeight)
    }
}

