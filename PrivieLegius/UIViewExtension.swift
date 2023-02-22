//
//  UIViewExtension.swift
//  PrivieLegius
//
//  Created by raul.santos on 23/09/22.
//

import Foundation
import UIKit

extension UIView {
    
    public func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        var cornerMask = CACornerMask()
        if(corners.contains(.topLeft)){
            cornerMask.insert(.layerMinXMinYCorner)
        }
        if(corners.contains(.topRight)){
            cornerMask.insert(.layerMaxXMinYCorner)
        }
        if(corners.contains(.bottomLeft)){
            cornerMask.insert(.layerMinXMaxYCorner)
        }
        if(corners.contains(.bottomRight)){
            cornerMask.insert(.layerMaxXMaxYCorner)
        }
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = cornerMask
    }
    
    public func roundCorners(_ cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    
    public func dropShadow(scale: Bool = true, masksToBounds: Bool) {
        layer.masksToBounds = masksToBounds
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 2.5
    }
    // Método para shadow nas células
    public func setupCardView(){
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 16
       
    }
    
    public func setupCardMaiorView(){
        
        let shadowLayer = CAShapeLayer()
        self.layer.cornerRadius = 4
        shadowLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath
        shadowLayer.fillColor = self.backgroundColor?.cgColor
        shadowLayer.shadowColor = UIColor.black.cgColor
        shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        shadowLayer.shadowOpacity = 16
        shadowLayer.shadowRadius = 4.0
        self.layer.insertSublayer(shadowLayer, at: 0)
    }
}
