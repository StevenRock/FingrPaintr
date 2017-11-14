//
//  CanvasView.swift
//  FingrPaintr
//
//  Created by Steven Lin on 2017/11/1.
//  Copyright © 2017年 Steven. All rights reserved.
//

import UIKit
var lineWidthSizeLabel:Float = 0.0
var opacityValueLabel:Float = 1
var currentColor: UIColor!

class CanvasView: UIView {
    
    @IBOutlet weak var resetBtn: UIButton!
    var lineCap = CGLineCap.round
    var lineWidth: CGFloat = 10
    var colorOpacity: CGFloat = 1
    var penColor = UIColor.black
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnImgChanged()
        
        currentColor = penColor
        lineWidthSizeLabel = Float(lineWidth)
        opacityValueLabel = Float(colorOpacity)
        
        //self.backgroundColor = UIColor.brown//optional
        
        NotificationCenter.default.addObserver(self, selector: #selector(lineCapChanged), name: NSNotification.Name(rawValue: "lineCap"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(widthChanged), name: NSNotification.Name(rawValue: "width"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(colorChanged), name: NSNotification.Name(rawValue: "color"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(opacityChanged), name: NSNotification.Name(rawValue: "opacity"), object: nil)
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
        
        let chosedColor = penColor
        let setColor = chosedColor.withAlphaComponent(colorOpacity)//optional
        
        setColor.setStroke()
        
        ctx?.setLineWidth(lineWidth)
        
        ctx?.strokePath()
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        layer.contents = image?.cgImage
        
        UIGraphicsEndImageContext()
    }

    func btnImgChanged(){
        
        let img1 = UIImage(named: "reset1")
        let img2 = UIImage(named: "reset")
        resetBtn.imageView?.animationImages = [img1!,img2!]
        resetBtn.imageView?.animationRepeatCount = 0
        resetBtn.imageView?.animationDuration = 5
        resetBtn.imageView?.startAnimating()
    }
    
    @IBAction func leftSideOpen(_ sender: UIButton) {
        self.window?.rootViewController?.slideMenuController()?.openLeft()
    }
    
    @IBAction func rightSideOpen(_ sender: UIButton) {
        self.window?.rootViewController?.slideMenuController()?.openRight()
    }
    
    @IBAction func resetCanvas(_ sender: UIButton) {
        let alert = UIAlertController(title: "Warning", message: "Do You Really Want to Reset your canvas?", preferredStyle: .alert)
        let yes = UIAlertAction(title: "Yes", style: .default) { _ in
            self.image = nil
            self.layer.contents = self.image
        }
        let no = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alert.addAction(yes)
        alert.addAction(no)
        
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
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
    
    @objc func opacityChanged(notification: NSNotification){
        colorOpacity = notification.userInfo?["opacity"]as! CGFloat
    }
    
}
