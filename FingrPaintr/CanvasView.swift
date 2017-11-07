//
//  CanvasView.swift
//  FingrPaintr
//
//  Created by Steven Lin on 2017/11/1.
//  Copyright © 2017年 Steven. All rights reserved.
//

import UIKit
var lineWidthSizeLabel:Float = 0.0
var currentColor: UIColor!

class CanvasView: UIView {
    
    var lineCap = CGLineCap.round
    var lineWidth: CGFloat = 10
    var colorOpacity: CGFloat = 1
    var penColor = UIColor.black

    override func awakeFromNib() {
        super.awakeFromNib()
        currentColor = penColor
        lineWidthSizeLabel = Float(lineWidth)
        
        NotificationCenter.default.addObserver(self, selector: #selector(lineCapChanged), name: NSNotification.Name(rawValue: "lineCap"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(widthChanged), name: NSNotification.Name(rawValue: "width"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(colorChanged), name: NSNotification.Name(rawValue: "color"), object: nil)
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
        
        let chosedColor = penColor //optional
        let setColor = chosedColor.withAlphaComponent(colorOpacity)//optional
        setColor.setStroke()
        
        ctx?.setLineWidth(lineWidth)
        
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
    
    @objc func colorChanged(notification: NSNotification){
        
        penColor = notification.userInfo?["color"]as! UIColor
    }
}
