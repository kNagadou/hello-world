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
        self.rightButton.setTitle("Reset", for: UIControlState.normal)
        self.leftButton.setTitle("Green", for: UIControlState.normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onRightButton(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.white
        log?.debug(sender.titleLabel!.text!)
    }

    @IBAction func onLeftButton(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.green
        log?.debug(sender.titleLabel!.text!)
    }
}

