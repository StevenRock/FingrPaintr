//
//  extension.swift
//  FingrPaintr
//
//  Created by Steven Lin on 2017/11/2.
//  Copyright © 2017年 Steven. All rights reserved.
//

import UIKit

public extension UIButton{
    
    public func extend(){
        
        let move = CABasicAnimation(keyPath: "position")
        move.duration = 0.5
        
        let fromPoint = CGPoint(x: center.x, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 20, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        move.fromValue = fromValue
        move.toValue = toValue
        
        layer.add(move, forKey: "position")
    }
}

public extension UIView{
    
    public func round(){
        
        let width = bounds.width < bounds.height ? bounds.width : bounds.height
        let mask = CAShapeLayer()
        mask.path = UIBezierPath(ovalIn: CGRect(x: bounds.midX - width / 2, y: bounds.midY - width / 2, width: width, height: width)).cgPath
        self.layer.mask = mask
        
    }
}
