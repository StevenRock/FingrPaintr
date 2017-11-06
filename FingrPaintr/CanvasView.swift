//
//  CanvasView.swift
//  FingrPaintr
//
//  Created by Steven Lin on 2017/11/1.
//  Copyright © 2017年 Steven. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    
    var lineCap = CGLineCap.round
    var lineWidth: CGFloat = 10

    override func awakeFromNib() {
        super.awakeFromNib()
        
        NotificationCenter.default.addObserver(self, selector: #selector(lineCapChanged), name: NSNotification.Name(rawValue: "lineCap"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(widthChanged), name: NSNotification.Name(rawValue: "width"), object: nil)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let coodinate = touch.location(in: self)
            
            let previous = touch.previousLocation(in: self)
            
            drawline(from: previous, to: coodinate)
        }
    }
    
    var image: UIImage?
    func drawline(from: CGPoint, to: CGPoint){
        
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false, 1)
        
        image?.draw(in: self.bounds)
        
        let ctx = UIGraphicsGetCurrentContext()
        
        ctx?.move(to: from)
        
        ctx?.setLineCap(lineCap)
        
        ctx?.addLine(to: to)
        
        UIColor.black.setStroke()//make it optional
        
        ctx?.setLineWidth(lineWidth)//make it optional
        
        ctx?.strokePath()
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        layer.contents = image?.cgImage
        
        UIGraphicsEndImageContext()
    }
    
    @objc func lineCapChanged(notification: NSNotification){
        
        lineCap = notification.userInfo?["lineCap"]as! CGLineCap
        
    }
    
    @objc func widthChanged(notification: NSNotification) {
        
        lineWidth = notification.userInfo?["width"]as! CGFloat
    }
}
