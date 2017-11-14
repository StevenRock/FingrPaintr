//
//  LeftViewController.swift
//  FingrPaintr
//
//  Created by Steven Lin on 2017/11/1.
//  Copyright © 2017年 Steven. All rights reserved.
//

import UIKit


class LeftViewController: UIViewController {
    
    @IBOutlet weak var eraserBtn: UIButton!
    @IBOutlet weak var squareHeadBtn: UIButton!
    @IBOutlet weak var lineHeadBtn: UIButton!
    @IBOutlet weak var roundHeadBtn: UIButton!
    @IBOutlet weak var widthSlider: UISlider!
    @IBOutlet weak var widthValueLabel: UILabel!
    @IBOutlet weak var galleryBtn: UIButton!
    
    let square_off = UIImage(named: "squareHeadUnselected.png")!
    let line_off = UIImage(named: "lineHeadUnselected.png")!
    let round_off = UIImage(named: "roundHeadUnselected.png")!
    let square_on = UIImage(named: "squareHeadSelected.png")!
    let line_on = UIImage(named: "lineHeadSelected.png")!
    let round_on = UIImage(named: "roundHeadSelected")!
    
    var sCenter:  CGFloat!
    var lCenter:  CGFloat!
    var rCenter: CGFloat!
    var eCenter: CGFloat!
    
    let rLineCap = CGLineCap.round
    let lLineCap = CGLineCap.butt
    let sLineCap = CGLineCap.square
    
    let eraserColor = UIColor.white
    let eraserOpacity:CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //widthSlider.setThumbImage(<#T##image: UIImage?##UIImage?#>, for: .normal)
        widthSlider.value = lineWidthSizeLabel
        widthValueLabel.text = String(lineWidthSizeLabel)
        
        sCenter = squareHeadBtn.frame.minX
        lCenter = lineHeadBtn.frame.minX
        rCenter = roundHeadBtn.frame.minX
        eCenter = eraserBtn.frame.minX

        // Do any additional setup after loading the view.
        
        squareHeadBtn.setImage(square_off, for: .normal)
        lineHeadBtn.setImage(line_off, for: .normal)
        roundHeadBtn.setImage(round_on, for: .normal)
        
        toggleButton(onButton: roundHeadBtn, offButton1: squareHeadBtn, offButton2: lineHeadBtn, offButton3: eraserBtn, offPosition1: sCenter, offPosition2: lCenter, offPosition3: eCenter)
    }
    
    @IBAction func goToGallery(_ sender: UIButton) {
        let galleryVC = storyboard?.instantiateViewController(withIdentifier: "galleryVC") as! GalleryCollectionViewController
        present(galleryVC, animated: true, completion: nil)
        
    
    }
    
    @IBAction func widthSliderChanged(_ sender: UISlider) {
        widthValueLabel.text = String(format: "%.1f", widthSlider.value)
        widthValueLabel.sizeToFit()
        
        let widthValue = CGFloat(widthSlider.value)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "width"), object: self, userInfo: ["width": widthValue])
    }
    
    @IBAction func squareHeadPressed(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "lineCap"), object: self, userInfo: ["lineCap": sLineCap])
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "color"), object: self, userInfo: ["color": currentColor])
        
        //設定button選中的圖案
        squareHeadBtn.setImage(square_on, for: .normal)
        lineHeadBtn.setImage(line_off, for: .normal)
        roundHeadBtn.setImage(round_off, for: .normal)
        
        //button觸發
        toggleButton(onButton: sender,
                     offButton1: roundHeadBtn,
                     offButton2: lineHeadBtn, offButton3: eraserBtn, offPosition1: rCenter, offPosition2: lCenter, offPosition3: eCenter
                     )
        
        //判斷是否要伸出去
        lineHeadBtn.isSelected = false
        roundHeadBtn.isSelected = false
        eraserBtn.isSelected = false
    }
    
    @IBAction func lineHeadPressed(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "lineCap"), object: self, userInfo: ["lineCap": lLineCap])
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "color"), object: self, userInfo: ["color": currentColor])
        
        //設定button選中的圖案
        squareHeadBtn.setImage(square_off, for: .normal)
        lineHeadBtn.setImage(line_on, for: .normal)
        roundHeadBtn.setImage(round_off, for: .normal)
        
        //button觸發
        toggleButton(onButton: sender,
                     offButton1: roundHeadBtn,
                     offButton2: squareHeadBtn, offButton3: eraserBtn, offPosition1: rCenter, offPosition2: sCenter, offPosition3: eCenter
                     )
        
        //判斷是否要伸出去
        squareHeadBtn.isSelected = false
        roundHeadBtn.isSelected = false
        eraserBtn.isSelected = false
    }
    
    @IBAction func roundHeadPressed(_ sender: UIButton) {
        //notification丟出
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "lineCap"), object: self, userInfo: ["lineCap": rLineCap])
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "color"), object: self, userInfo: ["color": currentColor])
        
        //設定button選中的圖案
        squareHeadBtn.setImage(square_off, for: .normal)
        lineHeadBtn.setImage(line_off, for: .normal)
        roundHeadBtn.setImage(round_on, for: .normal)

        //button觸發
        toggleButton(onButton: sender,
                     offButton1: lineHeadBtn,
                     offButton2: squareHeadBtn, offButton3: eraserBtn, offPosition1: sCenter, offPosition2: lCenter, offPosition3: eCenter
                     )
        
        //判斷是否要伸出去
        squareHeadBtn.isSelected = false
        lineHeadBtn.isSelected = false
        eraserBtn.isSelected = false
    }
    
    @IBAction func eraserPressed(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "lineCap"), object: self, userInfo: ["lineCap": rLineCap])
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "color"), object: self, userInfo: ["color": eraserColor])
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "opacity"), object: self, userInfo: ["opacity": eraserOpacity])
        
        
        toggleButton(onButton: eraserBtn, offButton1: roundHeadBtn, offButton2: lineHeadBtn, offButton3: squareHeadBtn, offPosition1: rCenter, offPosition2: lCenter, offPosition3: sCenter)
        
        squareHeadBtn.isSelected = false
        lineHeadBtn.isSelected = false
        roundHeadBtn.isSelected = false
    }
    
    func toggleButton(onButton: UIButton, offButton1: UIButton, offButton2: UIButton, offButton3: UIButton, offPosition1: CGFloat, offPosition2: CGFloat, offPosition3: CGFloat){
        
        if onButton.isSelected == false{
            
            UIView.animate(withDuration: 0.5, animations: {
                onButton.frame = CGRect(x: onButton.frame.minX + 70, y: onButton.frame.minY, width: onButton.frame.width, height: onButton.frame.height)
            })
            onButton.isSelected = true
        }
        
        UIView.animate(withDuration: 0.5, animations: {
                offButton1.frame = CGRect(x: offPosition1, y: offButton1.frame.minY, width: offButton1.frame.width, height: offButton1.frame.height)
            })
        
        UIView.animate(withDuration: 0.5, animations: {
            offButton2.frame = CGRect(x: offPosition2, y: offButton2.frame.minY, width: offButton2.frame.width, height: offButton2.frame.height)
        })
        
        UIView.animate(withDuration: 0.5, animations: {
            offButton3.frame = CGRect(x: offPosition3, y: offButton3.frame.minY, width: offButton3.frame.width, height: offButton3.frame.height)
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
