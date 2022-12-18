//
//  Helper.swift
//  KaroooooCodeChallenge
//
//  Created by Sanjay on 18/12/22.
//

import UIKit
final class ShadowView: UIView {
    private var shadowLayer: CAShapeLayer!
    override func layoutSubviews() {
        super.layoutSubviews()

        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 12).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor

            shadowLayer.shadowColor = UIColor.gray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.5, height: 0.5)
            shadowLayer.shadowOpacity = 2.0
            shadowLayer.shadowRadius = 4
            layer.insertSublayer(shadowLayer, at: 0)
             //layer.insertSublayer(shadowLayer, below: nil) // also works
        }
    }

}
