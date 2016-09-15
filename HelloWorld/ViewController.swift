//
//  ViewController.swift
//  HelloWorld
//
//  Created by 長堂嘉寿将 on 2016/09/15.
//  Copyright © 2016年 kNagadou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.rightButton.titleLabel?.text = "Reset"
        self.leftButton.titleLabel?.text = "Green"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onRightButton(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.white
    }

    @IBAction func onLeftButton(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.green
    }
}

