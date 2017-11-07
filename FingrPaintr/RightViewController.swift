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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.backgroundColor = UIColor.black
        aView.round()
        colorView.round()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func colorChangePressed(_ sender: UIButton) {
        var chosedColor: UIColor!
        
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
        
        currentColor = chosedColor
        colorView.backgroundColor = chosedColor
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "color"), object: self, userInfo: ["color": currentColor])
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
