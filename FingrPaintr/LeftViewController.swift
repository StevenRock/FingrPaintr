//
//  LeftViewController.swift
//  FingrPaintr
//
//  Created by Steven Lin on 2017/11/1.
//  Copyright © 2017年 Steven. All rights reserved.
//

import UIKit


class LeftViewController: UIViewController {

    @IBOutlet weak var squareHeadBtn: UIButton!
    @IBOutlet weak var lineHeadBtn: UIButton!
    @IBOutlet weak var roundHeadBtn: UIButton!
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var widthValueLabel: UILabel!
    
    let square_off = UIImage(named: "squareHeadUnselected.png")!
    let line_off = UIImage(named: "lineHeadUnselected.png")!
    let round_off = UIImage(named: "roundHeadUnselected.png")!
    let square_on = UIImage(named: "squareHeadSelected.png")!
    let line_on = UIImage(named: "lineHeadSelected.png")!
    let round_on = UIImage(named: "roundHeadSelected")!
    
    var sCenter:  CGFloat!
    var lCenter:  CGFloat!
    var rCenter: CGFloat!
    
    let rLineCap = CGLineCap.round
    let lLineCap = CGLineCap.butt
    let sLineCap = CGLineCap.square
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //widthSlider.setThumbImage(<#T##image: UIImage?##UIImage?#>, for: .normal)
        
        sCenter = squareHeadBtn.frame.minX
        lCenter = lineHeadBtn.frame.minX
        rCenter = roundHeadBtn.frame.minX

        // Do any additional setup after loading the view.
        
        squareHeadBtn.setImage(square_off, for: .normal)
        lineHeadBtn.setImage(line_off, for: .normal)
        roundHeadBtn.setImage(round_on, for: .normal)
        
        toggleButton(onButton: roundHeadBtn, offButton1: squareHeadBtn, offButton2: lineHeadBtn, offPosition1: sCenter, offPosition2: lCenter)
        
    }

    @IBAction func widthSliderChanged(_ sender: UISlider) {
        widthValueLabel.text = String(format: "%.1f", widthSlider.value)
        widthValueLabel.sizeToFit()
        
        let widthValue = CGFloat(widthSlider.value)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "width"), object: self, userInfo: ["width": widthValue])
        
    }
    
    @IBAction func squareHeadPressed(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "lineCap"), object: self, userInfo: ["lineCap": sLineCap])
        
        //設定button選中的圖案
        squareHeadBtn.setImage(square_on, for: .normal)
        lineHeadBtn.setImage(line_off, for: .normal)
        roundHeadBtn.setImage(round_off, for: .normal)
        
        //button觸發
        toggleButton(onButton: sender,
                     offButton1: roundHeadBtn,
                     offButton2: lineHeadBtn, offPosition1: rCenter, offPosition2: lCenter
                     )
        
        //判斷是否要伸出去
        lineHeadBtn.isSelected = false
        roundHeadBtn.isSelected = false
    }
    
    @IBAction func lineHeadPressed(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "lineCap"), object: self, userInfo: ["lineCap": lLineCap])
        
        //設定button選中的圖案
        squareHeadBtn.setImage(square_off, for: .normal)
        lineHeadBtn.setImage(line_on, for: .normal)
        roundHeadBtn.setImage(round_off, for: .normal)
        
        //button觸發
        toggleButton(onButton: sender,
                     offButton1: roundHeadBtn,
                     offButton2: squareHeadBtn, offPosition1: rCenter, offPosition2: sCenter
                     )
        
        //判斷是否要伸出去
        squareHeadBtn.isSelected = false
        roundHeadBtn.isSelected = false
    }
    
    @IBAction func roundHeadPressed(_ sender: UIButton) {
        //notification丟出
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "lineCap"), object: self, userInfo: ["lineCap": rLineCap])
        
        //設定button選中的圖案
        squareHeadBtn.setImage(square_off, for: .normal)
        lineHeadBtn.setImage(line_off, for: .normal)
        roundHeadBtn.setImage(round_on, for: .normal)

        //button觸發
        toggleButton(onButton: sender,
                     offButton1: lineHeadBtn,
                     offButton2: squareHeadBtn, offPosition1: sCenter, offPosition2: lCenter
                     )
        
        //判斷是否要伸出去
        squareHeadBtn.isSelected = false
        lineHeadBtn.isSelected = false
    }
    
    func toggleButton(onButton: UIButton, offButton1: UIButton, offButton2: UIButton, offPosition1: CGFloat, offPosition2: CGFloat){
        
        if onButton.isSelected == false{
            
            UIView.animate(withDuration: 0.5, animations: {
                onButton.frame = CGRect(x: onButton.frame.minX + 50, y: onButton.frame.minY, width: onButton.frame.width, height: onButton.frame.height)
            })
            onButton.isSelected = true
        }
        
        UIView.animate(withDuration: 0.5, animations: {
                offButton1.frame = CGRect(x: offPosition1, y: offButton1.frame.minY, width: offButton1.frame.width, height: offButton1.frame.height)
            })
        
        UIView.animate(withDuration: 0.5, animations: {
            offButton2.frame = CGRect(x: offPosition2, y: offButton2.frame.minY, width: offButton2.frame.width, height: offButton2.frame.height)
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
