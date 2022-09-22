//
//  GCDUtils.swift
//  Labrand
//
//  Created by Shakhzod on 22/09/22.
//

import Foundation

func inBackground(qos: DispatchQoS.QoSClass = .default, _ block: @escaping ()-> ()) {
    DispatchQueue.global(qos: qos).async {
        block()
    }
}

func onMain(_ block: @escaping ()-> ()) {
    DispatchQueue.main.async {
        block()
    }
}

func delay(_ delay: Double, block: @escaping () -> (Void)) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: block)
}
