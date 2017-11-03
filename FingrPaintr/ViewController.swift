//
//  ViewController.swift
//  FingrPaintr
//
//  Created by Steven Lin on 2017/11/1.
//  Copyright © 2017年 Steven. All rights reserved.
//

import UIKit

class ViewController: SlideMenuController {
    
    override func awakeFromNib() {
        if let mainController = self.storyboard?.instantiateViewController(withIdentifier: "main"){
            self.mainViewController = mainController
        }
        
        if let leftController = self.storyboard?.instantiateViewController(withIdentifier: "left"){
            self.leftViewController = leftController
        }
        
        if let rightController = self.storyboard?.instantiateViewController(withIdentifier: "right"){
            self.rightViewController = rightController
        }
        
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

