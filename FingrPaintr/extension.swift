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

public extension UIColor{
    func rgb() -> (r:Int, g:Int, b:Int, a:Int)? {
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha){
            let iRed = Int(fRed * 255)
            let iGreen = Int(fGreen * 255)
            let iBlue = Int(fBlue * 255)
            let iAlpha = Int(fAlpha * 255)
            
            return (r:iRed, g:iGreen, b:iBlue, a:iAlpha)
        }else{
            return nil
        }
    }
}

public extension UIView{
    
    public func round(){
        
        let width = bounds.width < bounds.height ? bounds.width : bounds.height
        let mask = CAShapeLayer()
        mask.path = UIBezierPath(ovalIn: CGRect(x: bounds.midX - width / 2, y: bounds.midY - width / 2, width: width, height: width)).cgPath
        self.layer.mask = mask
        
    }
    
    func viewGradientLayer(){
        let viewGradient = CAGradientLayer()
        viewGradient.frame = self.bounds
        viewGradient.colors = [UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.7).cgColor,
                               UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 0.7).cgColor,
                               UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 0.7).cgColor]
        viewGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        viewGradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.layer.insertSublayer(viewGradient, at: 0)
    }
}

public extension UIImage{
    
    func maskWithColor(color:UIColor) -> UIImage? {
        let maskImage = cgImage!
        
        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        
        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        }else{
            return nil
        }
    }
}

