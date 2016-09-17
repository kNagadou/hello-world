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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    let colors: Dictionary<String, UIColor> = ["White": UIColor.white, "Green": UIColor.green]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitleOfButton()
        self.setTitleOfSegments()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setTitleOfButton() {
        self.rightButton.setTitle("White", for: UIControlState.normal)
        self.leftButton.setTitle("Green", for: UIControlState.normal)
    }
    
    func setTitleOfSegments() {
        let numOfSegments: Int = self.segmentedControl.numberOfSegments
        let colors: [String] = Array(self.colors.keys)
        for i in 0..<numOfSegments {
            self.segmentedControl.setTitle(colors[i], forSegmentAt: i)
        }
    }
    
    @IBAction func changeValue(_ sender: AnyObject) {
        let ui: UISegmentedControl = sender as! UISegmentedControl
        let segmentTitle: String? = ui.titleForSegment(at: ui.selectedSegmentIndex)
        self.view.backgroundColor = self.colors[segmentTitle!]
        log?.debug(segmentTitle!)
    }

    @IBAction func onRightButton(_ sender: UIButton) {
        self.view.backgroundColor = self.colors[sender.titleLabel!.text!]
        log?.debug(sender.titleLabel!.text!)
    }

    @IBAction func onLeftButton(_ sender: UIButton) {
        self.view.backgroundColor = self.colors[sender.titleLabel!.text!]
        log?.debug(sender.titleLabel!.text!)
    }
}

