//
//  RightViewController.swift
//  FingrPaintr
//
//  Created by Steven Lin on 2017/11/1.
//  Copyright © 2017年 Steven. All rights reserved.
//

import UIKit

class RightViewController: UIViewController {

    @IBOutlet weak var aView: UIView!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var opacitySlider: UISlider!
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
    
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var whiteBtn: UIButton!
    @IBOutlet weak var darkGrayBtn: UIButton!
    @IBOutlet weak var lightGrayBtn: UIButton!
    @IBOutlet weak var grayBtn: UIButton!
    @IBOutlet weak var redBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var cyanBtn: UIButton!
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var magentaBtn: UIButton!
    @IBOutlet weak var orangeBtn: UIButton!
    @IBOutlet weak var purpleBtn: UIButton!
    @IBOutlet weak var brownBtn: UIButton!
    
    var chosedColor = UIColor.black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.backgroundColor = UIColor.black
        aView.round()
        aView.viewGradientLayer()
        colorView.round()
        opacitySlider.value = opacityValueLabel*100
        // Do any additional setup after loading the view.
    }
    
    @IBAction func colorChangePressed(_ sender: UIButton) {
        
        switch sender {
        case blackBtn:
            chosedColor = UIColor.black
        case whiteBtn:
            chosedColor = UIColor.white
        case darkGrayBtn:
            chosedColor = UIColor.darkGray
        case lightGrayBtn:
            chosedColor = UIColor.lightGray
        case grayBtn:
            chosedColor = UIColor.gray
            
        case redBtn:
            chosedColor = UIColor.red
        case greenBtn:
            chosedColor = UIColor.green
        case blueBtn:
            chosedColor = UIColor.blue
        case cyanBtn:
            chosedColor = UIColor.cyan
        case yellowBtn:
            chosedColor = UIColor.yellow
        case magentaBtn:
            chosedColor = UIColor.magenta
        case orangeBtn:
            chosedColor = UIColor.orange
        case purpleBtn:
            chosedColor = UIColor.purple
        case brownBtn:
            chosedColor = UIColor.brown
        default:
            break
        }
        
        let rgb = chosedColor.rgb()
        UIView.animate(withDuration: 0.5) {
            self.rSlider.setValue(Float((rgb?.r)!), animated: true)
            self.gSlider.setValue(Float((rgb?.g)!), animated: true)
            self.bSlider.setValue(Float((rgb?.b)!), animated: true)
        }
        
        currentColor = chosedColor
        colorView.backgroundColor = chosedColor
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "color"), object: self, userInfo: ["color": currentColor])
    }
    
    @IBAction func customColorChanged(_ sender: UISlider) {
            let r = CGFloat(rSlider.value/255)
            let g = CGFloat(gSlider.value/255)
            let b = CGFloat(bSlider.value/255)
        
        chosedColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        currentColor = chosedColor
        colorView.backgroundColor = chosedColor
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "color"), object: self, userInfo: ["color": currentColor])
    }
    
    
    @IBAction func opcaityChanged(_ sender: UISlider) {
        let opacityValue = CGFloat(opacitySlider.value/100)
        chosedColor.withAlphaComponent(opacityValue)
        colorView.backgroundColor = chosedColor
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "opacity"), object: self, userInfo: ["opacity":opacityValue])
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
